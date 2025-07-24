# frozen_string_literal: true
require_relative "../../../requests"
require_relative "../../types/bulk_delete_location_custom_attributes_response"
require_relative "../../types/bulk_upsert_location_custom_attributes_response"
require_relative "../../types/visibility_filter"
require_relative "../../types/list_location_custom_attributes_response"
require_relative "../../types/retrieve_location_custom_attribute_response"
require_relative "../../types/custom_attribute"
require_relative "../../types/upsert_location_custom_attribute_response"
require_relative "../../types/delete_location_custom_attribute_response"
require "async"
require "async"
require "async"
require "async"
require "async"
require "async"
require_relative "../../../requests"

module SquareApiClient
  module Locations
    class CustomAttributesClient
    # @return [SquareApiClient::RequestClient] 
      attr_reader :request_client


      # @param request_client [SquareApiClient::RequestClient] 
      # @return [SquareApiClient::Locations::CustomAttributesClient]
      def initialize(request_client:)
        @request_client = request_client
      end
# Deletes [custom attributes](entity:CustomAttribute) for locations as a bulk
#  operation.
#  To delete a custom attribute owned by another application, the `visibility`
#  setting must be
#  `VISIBILITY_READ_WRITE_VALUES`.
      #
      # @param values [Hash{String => SquareApiClient::BulkDeleteLocationCustomAttributesRequestLocationCustomAttributeDeleteRequest}] The data used to update the `CustomAttribute` objects.
#  The keys must be unique and are used to map to the corresponding response.
      # @param request_options [SquareApiClient::RequestOptions] 
      # @return [SquareApiClient::BulkDeleteLocationCustomAttributesResponse]
      # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.locations.custom_attributes.batch_delete(values: { "id1": { key: "bestseller" }, "id2": { key: "bestseller" }, "id3": { key: "phone-number" } })
      def batch_delete(values:, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), values: values }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/locations/custom-attributes/bulk-delete"
end
        SquareApiClient::BulkDeleteLocationCustomAttributesResponse.from_json(json_object: response.body)
      end
# Creates or updates [custom attributes](entity:CustomAttribute) for locations as
#  a bulk operation.
#  Use this endpoint to set the value of one or more custom attributes for one or
#  more locations.
#  A custom attribute is based on a custom attribute definition in a Square seller
#  account, which is
#  created using the
#  ](api-endpoint:LocationCustomAttributes-CreateLocationCustomAttributeDefinition)
#  endpoint.
#  This `BulkUpsertLocationCustomAttributes` endpoint accepts a map of 1 to 25
#  individual upsert
#  requests and returns a map of individual upsert responses. Each upsert request
#  has a unique ID
#  and provides a location ID and custom attribute. Each upsert response is
#  returned with the ID
#  of the corresponding request.
#  To create or update a custom attribute owned by another application, the
#  `visibility` setting
#  must be `VISIBILITY_READ_WRITE_VALUES`.
      #
      # @param values [Hash{String => SquareApiClient::BulkUpsertLocationCustomAttributesRequestLocationCustomAttributeUpsertRequest}] A map containing 1 to 25 individual upsert requests. For each request, provide
#  an
#  arbitrary ID that is unique for this `BulkUpsertLocationCustomAttributes`
#  request and the
#  information needed to create or update a custom attribute.
      # @param request_options [SquareApiClient::RequestOptions] 
      # @return [SquareApiClient::BulkUpsertLocationCustomAttributesResponse]
      # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.locations.custom_attributes.batch_upsert(values: { "id1": { location_id: "L0TBCBTB7P8RQ", custom_attribute: { key: "bestseller", value: "hot cocoa" } }, "id2": { location_id: "L9XMD04V3STJX", custom_attribute: { key: "bestseller", value: "berry smoothie" } }, "id3": { location_id: "L0TBCBTB7P8RQ", custom_attribute: { key: "phone-number", value: "+12223334444" } } })
      def batch_upsert(values:, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), values: values }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/locations/custom-attributes/bulk-upsert"
end
        SquareApiClient::BulkUpsertLocationCustomAttributesResponse.from_json(json_object: response.body)
      end
# Lists the [custom attributes](entity:CustomAttribute) associated with a
#  location.
#  You can use the `with_definitions` query parameter to also retrieve custom
#  attribute definitions
#  in the same call.
#  When all response pages are retrieved, the results include all custom attributes
#  that are
#  visible to the requesting application, including those that are owned by other
#  applications
#  and set to `VISIBILITY_READ_ONLY` or `VISIBILITY_READ_WRITE_VALUES`.
      #
      # @param location_id [String] The ID of the target [location](entity:Location).
      # @param visibility_filter [SquareApiClient::VisibilityFilter] Filters the `CustomAttributeDefinition` results by their `visibility` values.
      # @param limit [Integer] The maximum number of results to return in a single paged response. This limit
#  is advisory.
#  The response might contain more or fewer results. The minimum value is 1 and the
#  maximum value is 100.
#  The default value is 20. For more information, see
#  ttps://developer.squareup.com/docs/build-basics/common-api-patterns/pagination).
      # @param cursor [String] The cursor returned in the paged response from the previous call to this
#  endpoint.
#  Provide this cursor to retrieve the next page of results for your original
#  request. For more
#  information, see
#  ttps://developer.squareup.com/docs/build-basics/common-api-patterns/pagination).
      # @param with_definitions [Boolean] Indicates whether to return the [custom attribute
#  definition](entity:CustomAttributeDefinition) in the `definition` field of each
#  custom attribute. Set this parameter to `true` to get the name and description
#  of each custom
#  attribute, information about the data type, or other definition details. The
#  default value is `false`.
      # @param request_options [SquareApiClient::RequestOptions] 
      # @return [SquareApiClient::ListLocationCustomAttributesResponse]
      # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.locations.custom_attributes.list(location_id: "location_id")
      def list(location_id:, visibility_filter: nil, limit: nil, cursor: nil, with_definitions: nil, request_options: nil)
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
  req.params = { **(request_options&.additional_query_parameters || {}), "visibility_filter": visibility_filter, "limit": limit, "cursor": cursor, "with_definitions": with_definitions }.compact
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/locations/#{location_id}/custom-attributes"
end
        SquareApiClient::ListLocationCustomAttributesResponse.from_json(json_object: response.body)
      end
# Retrieves a [custom attribute](entity:CustomAttribute) associated with a
#  location.
#  You can use the `with_definition` query parameter to also retrieve the custom
#  attribute definition
#  in the same call.
#  To retrieve a custom attribute owned by another application, the `visibility`
#  setting must be
#  `VISIBILITY_READ_ONLY` or `VISIBILITY_READ_WRITE_VALUES`.
      #
      # @param location_id [String] The ID of the target [location](entity:Location).
      # @param key [String] The key of the custom attribute to retrieve. This key must match the `key` of a
#  custom
#  attribute definition in the Square seller account. If the requesting application
#  is not the
#  definition owner, you must use the qualified key.
      # @param with_definition [Boolean] Indicates whether to return the [custom attribute
#  definition](entity:CustomAttributeDefinition) in the `definition` field of
#  the custom attribute. Set this parameter to `true` to get the name and
#  description of the custom
#  attribute, information about the data type, or other definition details. The
#  default value is `false`.
      # @param version [Integer] The current version of the custom attribute, which is used for strongly
#  consistent reads to
#  guarantee that you receive the most up-to-date data. When included in the
#  request, Square
#  returns the specified version or a higher version if one exists. If the
#  specified version is
#  higher than the current version, Square returns a `BAD_REQUEST` error.
      # @param request_options [SquareApiClient::RequestOptions] 
      # @return [SquareApiClient::RetrieveLocationCustomAttributeResponse]
      # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.locations.custom_attributes.get(location_id: "location_id", key: "key")
      def get(location_id:, key:, with_definition: nil, version: nil, request_options: nil)
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
  req.params = { **(request_options&.additional_query_parameters || {}), "with_definition": with_definition, "version": version }.compact
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/locations/#{location_id}/custom-attributes/#{key}"
end
        SquareApiClient::RetrieveLocationCustomAttributeResponse.from_json(json_object: response.body)
      end
# Creates or updates a [custom attribute](entity:CustomAttribute) for a location.
#  Use this endpoint to set the value of a custom attribute for a specified
#  location.
#  A custom attribute is based on a custom attribute definition in a Square seller
#  account, which
#  is created using the
#  ](api-endpoint:LocationCustomAttributes-CreateLocationCustomAttributeDefinition)
#  endpoint.
#  To create or update a custom attribute owned by another application, the
#  `visibility` setting
#  must be `VISIBILITY_READ_WRITE_VALUES`.
      #
      # @param location_id [String] The ID of the target [location](entity:Location).
      # @param key [String] The key of the custom attribute to create or update. This key must match the
#  `key` of a
#  custom attribute definition in the Square seller account. If the requesting
#  application is not
#  the definition owner, you must use the qualified key.
      # @param custom_attribute [Hash] The custom attribute to create or update, with the following fields:
#  - `value`. This value must conform to the `schema` specified by the definition.
#  For more information, see [Supported data
#  oper.squareup.com/docs/devtools/customattributes/overview#supported-data-types).
#  - `version`. To enable [optimistic
#  loper.squareup.com/docs/build-basics/common-api-patterns/optimistic-concurrency)
#  control for an update operation, include the current version of the custom
#  attribute.
#  If this is not important for your application, version can be set to -1.Request of type SquareApiClient::CustomAttribute, as a Hash
      #   * :key (String) 
      #   * :value (Object) 
      #   * :version (Integer) 
      #   * :visibility (SquareApiClient::CustomAttributeDefinitionVisibility) 
      #   * :definition (Hash)
      #     * :key (String) 
      #     * :schema (Hash{String => Object}) 
      #     * :name (String) 
      #     * :description (String) 
      #     * :visibility (SquareApiClient::CustomAttributeDefinitionVisibility) 
      #     * :version (Integer) 
      #     * :updated_at (String) 
      #     * :created_at (String) 
      #   * :updated_at (String) 
      #   * :created_at (String) 
      # @param idempotency_key [String] A unique identifier for this request, used to ensure idempotency. For more
#  information,
#  see
#  tps://developer.squareup.com/docs/build-basics/common-api-patterns/idempotency).
      # @param request_options [SquareApiClient::RequestOptions] 
      # @return [SquareApiClient::UpsertLocationCustomAttributeResponse]
      # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.locations.custom_attributes.upsert(
#    location_id: "location_id",
#    key: "key",
#    custom_attribute: { value: "hot cocoa" }
#  )
      def upsert(location_id:, key:, custom_attribute:, idempotency_key: nil, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), custom_attribute: custom_attribute, idempotency_key: idempotency_key }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/locations/#{location_id}/custom-attributes/#{key}"
end
        SquareApiClient::UpsertLocationCustomAttributeResponse.from_json(json_object: response.body)
      end
# Deletes a [custom attribute](entity:CustomAttribute) associated with a location.
#  To delete a custom attribute owned by another application, the `visibility`
#  setting must be
#  `VISIBILITY_READ_WRITE_VALUES`.
      #
      # @param location_id [String] The ID of the target [location](entity:Location).
      # @param key [String] The key of the custom attribute to delete. This key must match the `key` of a
#  custom
#  attribute definition in the Square seller account. If the requesting application
#  is not the
#  definition owner, you must use the qualified key.
      # @param request_options [SquareApiClient::RequestOptions] 
      # @return [SquareApiClient::DeleteLocationCustomAttributeResponse]
      # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.locations.custom_attributes.delete(location_id: "location_id", key: "key")
      def delete(location_id:, key:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/locations/#{location_id}/custom-attributes/#{key}"
end
        SquareApiClient::DeleteLocationCustomAttributeResponse.from_json(json_object: response.body)
      end
    end
    class AsyncCustomAttributesClient
    # @return [SquareApiClient::AsyncRequestClient] 
      attr_reader :request_client


      # @param request_client [SquareApiClient::RequestClient] 
      # @return [SquareApiClient::Locations::AsyncCustomAttributesClient]
      def initialize(request_client:)
        @request_client = request_client
      end
# Deletes [custom attributes](entity:CustomAttribute) for locations as a bulk
#  operation.
#  To delete a custom attribute owned by another application, the `visibility`
#  setting must be
#  `VISIBILITY_READ_WRITE_VALUES`.
      #
      # @param values [Hash{String => SquareApiClient::BulkDeleteLocationCustomAttributesRequestLocationCustomAttributeDeleteRequest}] The data used to update the `CustomAttribute` objects.
#  The keys must be unique and are used to map to the corresponding response.
      # @param request_options [SquareApiClient::RequestOptions] 
      # @return [SquareApiClient::BulkDeleteLocationCustomAttributesResponse]
      # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.locations.custom_attributes.batch_delete(values: { "id1": { key: "bestseller" }, "id2": { key: "bestseller" }, "id3": { key: "phone-number" } })
      def batch_delete(values:, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), values: values }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/locations/custom-attributes/bulk-delete"
end
          SquareApiClient::BulkDeleteLocationCustomAttributesResponse.from_json(json_object: response.body)
        end
      end
# Creates or updates [custom attributes](entity:CustomAttribute) for locations as
#  a bulk operation.
#  Use this endpoint to set the value of one or more custom attributes for one or
#  more locations.
#  A custom attribute is based on a custom attribute definition in a Square seller
#  account, which is
#  created using the
#  ](api-endpoint:LocationCustomAttributes-CreateLocationCustomAttributeDefinition)
#  endpoint.
#  This `BulkUpsertLocationCustomAttributes` endpoint accepts a map of 1 to 25
#  individual upsert
#  requests and returns a map of individual upsert responses. Each upsert request
#  has a unique ID
#  and provides a location ID and custom attribute. Each upsert response is
#  returned with the ID
#  of the corresponding request.
#  To create or update a custom attribute owned by another application, the
#  `visibility` setting
#  must be `VISIBILITY_READ_WRITE_VALUES`.
      #
      # @param values [Hash{String => SquareApiClient::BulkUpsertLocationCustomAttributesRequestLocationCustomAttributeUpsertRequest}] A map containing 1 to 25 individual upsert requests. For each request, provide
#  an
#  arbitrary ID that is unique for this `BulkUpsertLocationCustomAttributes`
#  request and the
#  information needed to create or update a custom attribute.
      # @param request_options [SquareApiClient::RequestOptions] 
      # @return [SquareApiClient::BulkUpsertLocationCustomAttributesResponse]
      # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.locations.custom_attributes.batch_upsert(values: { "id1": { location_id: "L0TBCBTB7P8RQ", custom_attribute: { key: "bestseller", value: "hot cocoa" } }, "id2": { location_id: "L9XMD04V3STJX", custom_attribute: { key: "bestseller", value: "berry smoothie" } }, "id3": { location_id: "L0TBCBTB7P8RQ", custom_attribute: { key: "phone-number", value: "+12223334444" } } })
      def batch_upsert(values:, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), values: values }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/locations/custom-attributes/bulk-upsert"
end
          SquareApiClient::BulkUpsertLocationCustomAttributesResponse.from_json(json_object: response.body)
        end
      end
# Lists the [custom attributes](entity:CustomAttribute) associated with a
#  location.
#  You can use the `with_definitions` query parameter to also retrieve custom
#  attribute definitions
#  in the same call.
#  When all response pages are retrieved, the results include all custom attributes
#  that are
#  visible to the requesting application, including those that are owned by other
#  applications
#  and set to `VISIBILITY_READ_ONLY` or `VISIBILITY_READ_WRITE_VALUES`.
      #
      # @param location_id [String] The ID of the target [location](entity:Location).
      # @param visibility_filter [SquareApiClient::VisibilityFilter] Filters the `CustomAttributeDefinition` results by their `visibility` values.
      # @param limit [Integer] The maximum number of results to return in a single paged response. This limit
#  is advisory.
#  The response might contain more or fewer results. The minimum value is 1 and the
#  maximum value is 100.
#  The default value is 20. For more information, see
#  ttps://developer.squareup.com/docs/build-basics/common-api-patterns/pagination).
      # @param cursor [String] The cursor returned in the paged response from the previous call to this
#  endpoint.
#  Provide this cursor to retrieve the next page of results for your original
#  request. For more
#  information, see
#  ttps://developer.squareup.com/docs/build-basics/common-api-patterns/pagination).
      # @param with_definitions [Boolean] Indicates whether to return the [custom attribute
#  definition](entity:CustomAttributeDefinition) in the `definition` field of each
#  custom attribute. Set this parameter to `true` to get the name and description
#  of each custom
#  attribute, information about the data type, or other definition details. The
#  default value is `false`.
      # @param request_options [SquareApiClient::RequestOptions] 
      # @return [SquareApiClient::ListLocationCustomAttributesResponse]
      # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.locations.custom_attributes.list(location_id: "location_id")
      def list(location_id:, visibility_filter: nil, limit: nil, cursor: nil, with_definitions: nil, request_options: nil)
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
  req.params = { **(request_options&.additional_query_parameters || {}), "visibility_filter": visibility_filter, "limit": limit, "cursor": cursor, "with_definitions": with_definitions }.compact
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/locations/#{location_id}/custom-attributes"
end
          SquareApiClient::ListLocationCustomAttributesResponse.from_json(json_object: response.body)
        end
      end
# Retrieves a [custom attribute](entity:CustomAttribute) associated with a
#  location.
#  You can use the `with_definition` query parameter to also retrieve the custom
#  attribute definition
#  in the same call.
#  To retrieve a custom attribute owned by another application, the `visibility`
#  setting must be
#  `VISIBILITY_READ_ONLY` or `VISIBILITY_READ_WRITE_VALUES`.
      #
      # @param location_id [String] The ID of the target [location](entity:Location).
      # @param key [String] The key of the custom attribute to retrieve. This key must match the `key` of a
#  custom
#  attribute definition in the Square seller account. If the requesting application
#  is not the
#  definition owner, you must use the qualified key.
      # @param with_definition [Boolean] Indicates whether to return the [custom attribute
#  definition](entity:CustomAttributeDefinition) in the `definition` field of
#  the custom attribute. Set this parameter to `true` to get the name and
#  description of the custom
#  attribute, information about the data type, or other definition details. The
#  default value is `false`.
      # @param version [Integer] The current version of the custom attribute, which is used for strongly
#  consistent reads to
#  guarantee that you receive the most up-to-date data. When included in the
#  request, Square
#  returns the specified version or a higher version if one exists. If the
#  specified version is
#  higher than the current version, Square returns a `BAD_REQUEST` error.
      # @param request_options [SquareApiClient::RequestOptions] 
      # @return [SquareApiClient::RetrieveLocationCustomAttributeResponse]
      # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.locations.custom_attributes.get(location_id: "location_id", key: "key")
      def get(location_id:, key:, with_definition: nil, version: nil, request_options: nil)
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
  req.params = { **(request_options&.additional_query_parameters || {}), "with_definition": with_definition, "version": version }.compact
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/locations/#{location_id}/custom-attributes/#{key}"
end
          SquareApiClient::RetrieveLocationCustomAttributeResponse.from_json(json_object: response.body)
        end
      end
# Creates or updates a [custom attribute](entity:CustomAttribute) for a location.
#  Use this endpoint to set the value of a custom attribute for a specified
#  location.
#  A custom attribute is based on a custom attribute definition in a Square seller
#  account, which
#  is created using the
#  ](api-endpoint:LocationCustomAttributes-CreateLocationCustomAttributeDefinition)
#  endpoint.
#  To create or update a custom attribute owned by another application, the
#  `visibility` setting
#  must be `VISIBILITY_READ_WRITE_VALUES`.
      #
      # @param location_id [String] The ID of the target [location](entity:Location).
      # @param key [String] The key of the custom attribute to create or update. This key must match the
#  `key` of a
#  custom attribute definition in the Square seller account. If the requesting
#  application is not
#  the definition owner, you must use the qualified key.
      # @param custom_attribute [Hash] The custom attribute to create or update, with the following fields:
#  - `value`. This value must conform to the `schema` specified by the definition.
#  For more information, see [Supported data
#  oper.squareup.com/docs/devtools/customattributes/overview#supported-data-types).
#  - `version`. To enable [optimistic
#  loper.squareup.com/docs/build-basics/common-api-patterns/optimistic-concurrency)
#  control for an update operation, include the current version of the custom
#  attribute.
#  If this is not important for your application, version can be set to -1.Request of type SquareApiClient::CustomAttribute, as a Hash
      #   * :key (String) 
      #   * :value (Object) 
      #   * :version (Integer) 
      #   * :visibility (SquareApiClient::CustomAttributeDefinitionVisibility) 
      #   * :definition (Hash)
      #     * :key (String) 
      #     * :schema (Hash{String => Object}) 
      #     * :name (String) 
      #     * :description (String) 
      #     * :visibility (SquareApiClient::CustomAttributeDefinitionVisibility) 
      #     * :version (Integer) 
      #     * :updated_at (String) 
      #     * :created_at (String) 
      #   * :updated_at (String) 
      #   * :created_at (String) 
      # @param idempotency_key [String] A unique identifier for this request, used to ensure idempotency. For more
#  information,
#  see
#  tps://developer.squareup.com/docs/build-basics/common-api-patterns/idempotency).
      # @param request_options [SquareApiClient::RequestOptions] 
      # @return [SquareApiClient::UpsertLocationCustomAttributeResponse]
      # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.locations.custom_attributes.upsert(
#    location_id: "location_id",
#    key: "key",
#    custom_attribute: { value: "hot cocoa" }
#  )
      def upsert(location_id:, key:, custom_attribute:, idempotency_key: nil, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), custom_attribute: custom_attribute, idempotency_key: idempotency_key }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/locations/#{location_id}/custom-attributes/#{key}"
end
          SquareApiClient::UpsertLocationCustomAttributeResponse.from_json(json_object: response.body)
        end
      end
# Deletes a [custom attribute](entity:CustomAttribute) associated with a location.
#  To delete a custom attribute owned by another application, the `visibility`
#  setting must be
#  `VISIBILITY_READ_WRITE_VALUES`.
      #
      # @param location_id [String] The ID of the target [location](entity:Location).
      # @param key [String] The key of the custom attribute to delete. This key must match the `key` of a
#  custom
#  attribute definition in the Square seller account. If the requesting application
#  is not the
#  definition owner, you must use the qualified key.
      # @param request_options [SquareApiClient::RequestOptions] 
      # @return [SquareApiClient::DeleteLocationCustomAttributeResponse]
      # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.locations.custom_attributes.delete(location_id: "location_id", key: "key")
      def delete(location_id:, key:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/locations/#{location_id}/custom-attributes/#{key}"
end
          SquareApiClient::DeleteLocationCustomAttributeResponse.from_json(json_object: response.body)
        end
      end
    end
  end
end