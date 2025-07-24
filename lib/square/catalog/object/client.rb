# frozen_string_literal: true
require_relative "../../../requests"
require_relative "../../types/catalog_object"
require_relative "../../types/upsert_catalog_object_response"
require_relative "../../types/get_catalog_object_response"
require_relative "../../types/delete_catalog_object_response"
require "async"
require "async"
require "async"
require_relative "../../../requests"

module square.rb
  module Catalog
    class ObjectClient
    # @return [square.rb::RequestClient] 
      attr_reader :request_client


      # @param request_client [square.rb::RequestClient] 
      # @return [square.rb::Catalog::ObjectClient]
      def initialize(request_client:)
        @request_client = request_client
      end
# Creates a new or updates the specified [CatalogObject](entity:CatalogObject).
#  To ensure consistency, only one update request is processed at a time per seller
#  account.
#  While one (batch or non-batch) update request is being processed, other (batched
#  and non-batched)
#  update requests are rejected with the `429` error code.
      #
      # @param idempotency_key [String] A value you specify that uniquely identifies this
#  request among all your requests. A common way to create
#  a valid idempotency key is to use a Universally unique
#  identifier (UUID).
#  If you're unsure whether a particular request was successful,
#  you can reattempt it with the same idempotency key without
#  worrying about creating duplicate objects.
#  See
#  ttps://developer.squareup.com/docs/build-basics/common-api-patterns/idempotency)
#  for more information.
      # @param object [square.rb::CatalogObjectItem, square.rb::CatalogObjectImage, square.rb::CatalogObjectCategory, square.rb::CatalogObjectItemVariation, square.rb::CatalogObjectTax, square.rb::CatalogObjectDiscount, square.rb::CatalogObjectModifierList, square.rb::CatalogObjectModifier, square.rb::CatalogObjectPricingRule, square.rb::CatalogObjectProductSet, square.rb::CatalogObjectTimePeriod, square.rb::CatalogObjectMeasurementUnit, square.rb::CatalogObjectSubscriptionPlanVariation, square.rb::CatalogObjectItemOption, square.rb::CatalogObjectItemOptionValue, square.rb::CatalogObjectCustomAttributeDefinition, square.rb::CatalogObjectQuickAmountsSettings, square.rb::CatalogObjectSubscriptionPlan, square.rb::CatalogObjectAvailabilityPeriod] A CatalogObject to be created or updated.
#  - For updates, the object must be active (the `is_deleted` field is not `true`).
#  - For creates, the object ID must start with `#`. The provided ID is replaced
#  with a server-generated ID.
      # @param request_options [square.rb::RequestOptions] 
      # @return [square.rb::UpsertCatalogObjectResponse]
      # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.catalog.object.upsert(idempotency_key: "af3d1afc-7212-4300-b463-0bfc5314a5ae", object: { type: "IMAGE", id: "#Cocoa" })
      def upsert(idempotency_key:, object:, request_options: nil)
        response = @request_client.conn.post do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.version.nil?
    req.headers["Square-Version"] = request_options.version
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  req.body = { **(request_options&.additional_body_parameters || {}), idempotency_key: idempotency_key, object: object }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/catalog/object"
end
        square.rb::UpsertCatalogObjectResponse.from_json(json_object: response.body)
      end
# Returns a single [CatalogItem](entity:CatalogItem) as a
#  [CatalogObject](entity:CatalogObject) based on the provided ID. The returned
#  object includes all of the relevant [CatalogItem](entity:CatalogItem)
#  information including: [CatalogItemVariation](entity:CatalogItemVariation)
#  children, references to its
#  [CatalogModifierList](entity:CatalogModifierList) objects, and the ids of
#  any [CatalogTax](entity:CatalogTax) objects that apply to it.
      #
      # @param object_id [String] The object ID of any type of catalog objects to be retrieved.
      # @param include_related_objects [Boolean] If `true`, the response will include additional objects that are related to the
#  requested objects. Related objects are defined as any objects referenced by ID
#  by the results in the `objects` field
#  of the response. These objects are put in the `related_objects` field. Setting
#  this to `true` is
#  helpful when the objects are needed for immediate display to a user.
#  This process only goes one level deep. Objects referenced by the related objects
#  will not be included. For example,
#  if the `objects` field of the response contains a CatalogItem, its associated
#  CatalogCategory objects, CatalogTax objects, CatalogImage objects and
#  CatalogModifierLists will be returned in the `related_objects` field of the
#  response. If the `objects` field of the response contains a
#  CatalogItemVariation,
#  its parent CatalogItem will be returned in the `related_objects` field of
#  the response.
#  Default value: `false`
      # @param catalog_version [Long] Requests objects as of a specific version of the catalog. This allows you to
#  retrieve historical
#  versions of objects. The value to retrieve a specific version of an object can
#  be found
#  in the version field of [CatalogObject](entity:CatalogObject)s. If not included,
#  results will
#  be from the current version of the catalog.
      # @param include_category_path_to_root [Boolean] Specifies whether or not to include the `path_to_root` list for each returned
#  category instance. The `path_to_root` list consists
#  of `CategoryPathToRootNode` objects and specifies the path that starts with the
#  immediate parent category of the returned category
#  and ends with its root category. If the returned category is a top-level
#  category, the `path_to_root` list is empty and is not returned
#  in the response payload.
      # @param request_options [square.rb::RequestOptions] 
      # @return [square.rb::GetCatalogObjectResponse]
      # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.catalog.object.get(object_id: "object_id")
      def get(object_id:, include_related_objects: nil, catalog_version: nil, include_category_path_to_root: nil, request_options: nil)
        response = @request_client.conn.get do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.version.nil?
    req.headers["Square-Version"] = request_options.version
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  req.params = { **(request_options&.additional_query_parameters || {}), "include_related_objects": include_related_objects, "catalog_version": catalog_version, "include_category_path_to_root": include_category_path_to_root }.compact
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/catalog/object/#{object_id}"
end
        square.rb::GetCatalogObjectResponse.from_json(json_object: response.body)
      end
# Deletes a single [CatalogObject](entity:CatalogObject) based on the
#  provided ID and returns the set of successfully deleted IDs in the response.
#  Deletion is a cascading event such that all children of the targeted object
#  are also deleted. For example, deleting a [CatalogItem](entity:CatalogItem)
#  will also delete all of its
#  [CatalogItemVariation](entity:CatalogItemVariation) children.
#  To ensure consistency, only one delete request is processed at a time per seller
#  account.
#  While one (batch or non-batch) delete request is being processed, other (batched
#  and non-batched)
#  delete requests are rejected with the `429` error code.
      #
      # @param object_id [String] The ID of the catalog object to be deleted. When an object is deleted, other
#  objects in the graph that depend on that object will be deleted as well (for
#  example, deleting a
#  catalog item will delete its catalog item variations).
      # @param request_options [square.rb::RequestOptions] 
      # @return [square.rb::DeleteCatalogObjectResponse]
      # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.catalog.object.delete(object_id: "object_id")
      def delete(object_id:, request_options: nil)
        response = @request_client.conn.delete do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.version.nil?
    req.headers["Square-Version"] = request_options.version
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/catalog/object/#{object_id}"
end
        square.rb::DeleteCatalogObjectResponse.from_json(json_object: response.body)
      end
    end
    class AsyncObjectClient
    # @return [square.rb::AsyncRequestClient] 
      attr_reader :request_client


      # @param request_client [square.rb::RequestClient] 
      # @return [square.rb::Catalog::AsyncObjectClient]
      def initialize(request_client:)
        @request_client = request_client
      end
# Creates a new or updates the specified [CatalogObject](entity:CatalogObject).
#  To ensure consistency, only one update request is processed at a time per seller
#  account.
#  While one (batch or non-batch) update request is being processed, other (batched
#  and non-batched)
#  update requests are rejected with the `429` error code.
      #
      # @param idempotency_key [String] A value you specify that uniquely identifies this
#  request among all your requests. A common way to create
#  a valid idempotency key is to use a Universally unique
#  identifier (UUID).
#  If you're unsure whether a particular request was successful,
#  you can reattempt it with the same idempotency key without
#  worrying about creating duplicate objects.
#  See
#  ttps://developer.squareup.com/docs/build-basics/common-api-patterns/idempotency)
#  for more information.
      # @param object [square.rb::CatalogObjectItem, square.rb::CatalogObjectImage, square.rb::CatalogObjectCategory, square.rb::CatalogObjectItemVariation, square.rb::CatalogObjectTax, square.rb::CatalogObjectDiscount, square.rb::CatalogObjectModifierList, square.rb::CatalogObjectModifier, square.rb::CatalogObjectPricingRule, square.rb::CatalogObjectProductSet, square.rb::CatalogObjectTimePeriod, square.rb::CatalogObjectMeasurementUnit, square.rb::CatalogObjectSubscriptionPlanVariation, square.rb::CatalogObjectItemOption, square.rb::CatalogObjectItemOptionValue, square.rb::CatalogObjectCustomAttributeDefinition, square.rb::CatalogObjectQuickAmountsSettings, square.rb::CatalogObjectSubscriptionPlan, square.rb::CatalogObjectAvailabilityPeriod] A CatalogObject to be created or updated.
#  - For updates, the object must be active (the `is_deleted` field is not `true`).
#  - For creates, the object ID must start with `#`. The provided ID is replaced
#  with a server-generated ID.
      # @param request_options [square.rb::RequestOptions] 
      # @return [square.rb::UpsertCatalogObjectResponse]
      # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.catalog.object.upsert(idempotency_key: "af3d1afc-7212-4300-b463-0bfc5314a5ae", object: { type: "IMAGE", id: "#Cocoa" })
      def upsert(idempotency_key:, object:, request_options: nil)
        Async do
          response = @request_client.conn.post do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.version.nil?
    req.headers["Square-Version"] = request_options.version
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  req.body = { **(request_options&.additional_body_parameters || {}), idempotency_key: idempotency_key, object: object }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/catalog/object"
end
          square.rb::UpsertCatalogObjectResponse.from_json(json_object: response.body)
        end
      end
# Returns a single [CatalogItem](entity:CatalogItem) as a
#  [CatalogObject](entity:CatalogObject) based on the provided ID. The returned
#  object includes all of the relevant [CatalogItem](entity:CatalogItem)
#  information including: [CatalogItemVariation](entity:CatalogItemVariation)
#  children, references to its
#  [CatalogModifierList](entity:CatalogModifierList) objects, and the ids of
#  any [CatalogTax](entity:CatalogTax) objects that apply to it.
      #
      # @param object_id [String] The object ID of any type of catalog objects to be retrieved.
      # @param include_related_objects [Boolean] If `true`, the response will include additional objects that are related to the
#  requested objects. Related objects are defined as any objects referenced by ID
#  by the results in the `objects` field
#  of the response. These objects are put in the `related_objects` field. Setting
#  this to `true` is
#  helpful when the objects are needed for immediate display to a user.
#  This process only goes one level deep. Objects referenced by the related objects
#  will not be included. For example,
#  if the `objects` field of the response contains a CatalogItem, its associated
#  CatalogCategory objects, CatalogTax objects, CatalogImage objects and
#  CatalogModifierLists will be returned in the `related_objects` field of the
#  response. If the `objects` field of the response contains a
#  CatalogItemVariation,
#  its parent CatalogItem will be returned in the `related_objects` field of
#  the response.
#  Default value: `false`
      # @param catalog_version [Long] Requests objects as of a specific version of the catalog. This allows you to
#  retrieve historical
#  versions of objects. The value to retrieve a specific version of an object can
#  be found
#  in the version field of [CatalogObject](entity:CatalogObject)s. If not included,
#  results will
#  be from the current version of the catalog.
      # @param include_category_path_to_root [Boolean] Specifies whether or not to include the `path_to_root` list for each returned
#  category instance. The `path_to_root` list consists
#  of `CategoryPathToRootNode` objects and specifies the path that starts with the
#  immediate parent category of the returned category
#  and ends with its root category. If the returned category is a top-level
#  category, the `path_to_root` list is empty and is not returned
#  in the response payload.
      # @param request_options [square.rb::RequestOptions] 
      # @return [square.rb::GetCatalogObjectResponse]
      # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.catalog.object.get(object_id: "object_id")
      def get(object_id:, include_related_objects: nil, catalog_version: nil, include_category_path_to_root: nil, request_options: nil)
        Async do
          response = @request_client.conn.get do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.version.nil?
    req.headers["Square-Version"] = request_options.version
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  req.params = { **(request_options&.additional_query_parameters || {}), "include_related_objects": include_related_objects, "catalog_version": catalog_version, "include_category_path_to_root": include_category_path_to_root }.compact
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/catalog/object/#{object_id}"
end
          square.rb::GetCatalogObjectResponse.from_json(json_object: response.body)
        end
      end
# Deletes a single [CatalogObject](entity:CatalogObject) based on the
#  provided ID and returns the set of successfully deleted IDs in the response.
#  Deletion is a cascading event such that all children of the targeted object
#  are also deleted. For example, deleting a [CatalogItem](entity:CatalogItem)
#  will also delete all of its
#  [CatalogItemVariation](entity:CatalogItemVariation) children.
#  To ensure consistency, only one delete request is processed at a time per seller
#  account.
#  While one (batch or non-batch) delete request is being processed, other (batched
#  and non-batched)
#  delete requests are rejected with the `429` error code.
      #
      # @param object_id [String] The ID of the catalog object to be deleted. When an object is deleted, other
#  objects in the graph that depend on that object will be deleted as well (for
#  example, deleting a
#  catalog item will delete its catalog item variations).
      # @param request_options [square.rb::RequestOptions] 
      # @return [square.rb::DeleteCatalogObjectResponse]
      # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.catalog.object.delete(object_id: "object_id")
      def delete(object_id:, request_options: nil)
        Async do
          response = @request_client.conn.delete do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.version.nil?
    req.headers["Square-Version"] = request_options.version
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/catalog/object/#{object_id}"
end
          square.rb::DeleteCatalogObjectResponse.from_json(json_object: response.body)
        end
      end
    end
  end
end