# frozen_string_literal: true
require_relative "../../../requests"
require_relative "../../types/list_customer_custom_attribute_definitions_response"
require_relative "../../types/custom_attribute_definition"
require_relative "../../types/create_customer_custom_attribute_definition_response"
require_relative "../../types/get_customer_custom_attribute_definition_response"
require_relative "../../types/update_customer_custom_attribute_definition_response"
require_relative "../../types/delete_customer_custom_attribute_definition_response"
require_relative "../../types/batch_upsert_customer_custom_attributes_response"
require "async"
require "async"
require "async"
require "async"
require "async"
require "async"
require_relative "../../../requests"

module square.rb
  module Customers
    class CustomAttributeDefinitionsClient
    # @return [square.rb::RequestClient] 
      attr_reader :request_client


      # @param request_client [square.rb::RequestClient] 
      # @return [square.rb::Customers::CustomAttributeDefinitionsClient]
      def initialize(request_client:)
        @request_client = request_client
      end
# Lists the customer-related [custom attribute
#  definitions](entity:CustomAttributeDefinition) that belong to a Square seller
#  account.
#  When all response pages are retrieved, the results include all custom attribute
#  definitions
#  that are visible to the requesting application, including those that are created
#  by other
#  applications and set to `VISIBILITY_READ_ONLY` or
#  `VISIBILITY_READ_WRITE_VALUES`. Note that
#  seller-defined custom attributes (also known as custom fields) are always set to
#  `VISIBILITY_READ_WRITE_VALUES`.
      #
      # @param limit [Integer] The maximum number of results to return in a single paged response. This limit
#  is advisory.
#  The response might contain more or fewer results. The minimum value is 1 and the
#  maximum value is 100.
#  The default value is 20. For more information, see
#  ttps://developer.squareup.com/docs/build-basics/common-api-patterns/pagination).
      # @param cursor [String] The cursor returned in the paged response from the previous call to this
#  endpoint.
#  Provide this cursor to retrieve the next page of results for your original
#  request.
#  For more information, see
#  ttps://developer.squareup.com/docs/build-basics/common-api-patterns/pagination).
      # @param request_options [square.rb::RequestOptions] 
      # @return [square.rb::ListCustomerCustomAttributeDefinitionsResponse]
      # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.customers.custom_attribute_definitions.list
      def list(limit: nil, cursor: nil, request_options: nil)
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
  req.params = { **(request_options&.additional_query_parameters || {}), "limit": limit, "cursor": cursor }.compact
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/customers/custom-attribute-definitions"
end
        square.rb::ListCustomerCustomAttributeDefinitionsResponse.from_json(json_object: response.body)
      end
# Creates a customer-related [custom attribute
#  definition](entity:CustomAttributeDefinition) for a Square seller account.
#  Use this endpoint to define a custom attribute that can be associated with
#  customer profiles.
#  A custom attribute definition specifies the `key`, `visibility`, `schema`, and
#  other properties
#  for a custom attribute. After the definition is created, you can call
#  mAttribute](api-endpoint:CustomerCustomAttributes-UpsertCustomerCustomAttribute)
#  or
#  butes](api-endpoint:CustomerCustomAttributes-BulkUpsertCustomerCustomAttributes)
#  to set the custom attribute for customer profiles in the seller's Customer
#  Directory.
#  Sellers can view all custom attributes in exported customer data, including
#  those set to
#  `VISIBILITY_HIDDEN`.
      #
      # @param custom_attribute_definition [Hash] The custom attribute definition to create. Note the following:
#  - With the exception of the `Selection` data type, the `schema` is specified as
#  a simple URL to the JSON schema
#  definition hosted on the Square CDN. For more information, including supported
#  values and constraints, see
#  [Specifying the
#  ocs/customer-custom-attributes-api/custom-attribute-definitions#specify-schema).
#  - If provided, `name` must be unique (case-sensitive) across all visible
#  customer-related custom attribute definitions for the seller.
#  - All custom attributes are visible in exported customer data, including those
#  set to `VISIBILITY_HIDDEN`.Request of type square.rb::CustomAttributeDefinition, as a Hash
      #   * :key (String) 
      #   * :schema (Hash{String => Object}) 
      #   * :name (String) 
      #   * :description (String) 
      #   * :visibility (square.rb::CustomAttributeDefinitionVisibility) 
      #   * :version (Integer) 
      #   * :updated_at (String) 
      #   * :created_at (String) 
      # @param idempotency_key [String] A unique identifier for this request, used to ensure idempotency. For more
#  information,
#  see
#  tps://developer.squareup.com/docs/build-basics/common-api-patterns/idempotency).
      # @param request_options [square.rb::RequestOptions] 
      # @return [square.rb::CreateCustomerCustomAttributeDefinitionResponse]
      # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.customers.custom_attribute_definitions.create(custom_attribute_definition: { key: "favoritemovie", schema: { "ref": "https://developer-production-s.squarecdn.com/schemas/v1/common.json#squareup.common.String" }, name: "Favorite Movie", description: "The favorite movie of the customer.", visibility: VISIBILITY_HIDDEN })
      def create(custom_attribute_definition:, idempotency_key: nil, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), custom_attribute_definition: custom_attribute_definition, idempotency_key: idempotency_key }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/customers/custom-attribute-definitions"
end
        square.rb::CreateCustomerCustomAttributeDefinitionResponse.from_json(json_object: response.body)
      end
# Retrieves a customer-related [custom attribute
#  definition](entity:CustomAttributeDefinition) from a Square seller account.
#  To retrieve a custom attribute definition created by another application, the
#  `visibility`
#  setting must be `VISIBILITY_READ_ONLY` or `VISIBILITY_READ_WRITE_VALUES`. Note
#  that seller-defined custom attributes
#  (also known as custom fields) are always set to `VISIBILITY_READ_WRITE_VALUES`.
      #
      # @param key [String] The key of the custom attribute definition to retrieve. If the requesting
#  application
#  is not the definition owner, you must use the qualified key.
      # @param version [Integer] The current version of the custom attribute definition, which is used for
#  strongly consistent
#  reads to guarantee that you receive the most up-to-date data. When included in
#  the request,
#  Square returns the specified version or a higher version if one exists. If the
#  specified version
#  is higher than the current version, Square returns a `BAD_REQUEST` error.
      # @param request_options [square.rb::RequestOptions] 
      # @return [square.rb::GetCustomerCustomAttributeDefinitionResponse]
      # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.customers.custom_attribute_definitions.get(key: "key")
      def get(key:, version: nil, request_options: nil)
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
  req.params = { **(request_options&.additional_query_parameters || {}), "version": version }.compact
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/customers/custom-attribute-definitions/#{key}"
end
        square.rb::GetCustomerCustomAttributeDefinitionResponse.from_json(json_object: response.body)
      end
# Updates a customer-related [custom attribute
#  definition](entity:CustomAttributeDefinition) for a Square seller account.
#  Use this endpoint to update the following fields: `name`, `description`,
#  `visibility`, or the
#  `schema` for a `Selection` data type.
#  Only the definition owner can update a custom attribute definition. Note that
#  sellers can view
#  all custom attributes in exported customer data, including those set to
#  `VISIBILITY_HIDDEN`.
      #
      # @param key [String] The key of the custom attribute definition to update.
      # @param custom_attribute_definition [Hash] The custom attribute definition that contains the fields to update. This
#  endpoint
#  supports sparse updates, so only new or changed fields need to be included in
#  the request.
#  Only the following fields can be updated:
#  - `name`
#  - `description`
#  - `visibility`
#  - `schema` for a `Selection` data type. Only changes to the named options or the
#  maximum number of allowed
#  selections are supported.
#  For more information, see
#  [Updatable definition
#  custom-attributes-api/custom-attribute-definitions#updatable-definition-fields).
#  To enable [optimistic
#  loper.squareup.com/docs/build-basics/common-api-patterns/optimistic-concurrency)
#  control, include the optional `version` field and specify the current version of
#  the custom attribute definition.Request of type square.rb::CustomAttributeDefinition, as a Hash
      #   * :key (String) 
      #   * :schema (Hash{String => Object}) 
      #   * :name (String) 
      #   * :description (String) 
      #   * :visibility (square.rb::CustomAttributeDefinitionVisibility) 
      #   * :version (Integer) 
      #   * :updated_at (String) 
      #   * :created_at (String) 
      # @param idempotency_key [String] A unique identifier for this request, used to ensure idempotency. For more
#  information,
#  see
#  tps://developer.squareup.com/docs/build-basics/common-api-patterns/idempotency).
      # @param request_options [square.rb::RequestOptions] 
      # @return [square.rb::UpdateCustomerCustomAttributeDefinitionResponse]
      # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.customers.custom_attribute_definitions.update(key: "key", custom_attribute_definition: { description: "Update the description as desired.", visibility: VISIBILITY_READ_ONLY })
      def update(key:, custom_attribute_definition:, idempotency_key: nil, request_options: nil)
        response = @request_client.conn.put do | req |
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
  req.body = { **(request_options&.additional_body_parameters || {}), custom_attribute_definition: custom_attribute_definition, idempotency_key: idempotency_key }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/customers/custom-attribute-definitions/#{key}"
end
        square.rb::UpdateCustomerCustomAttributeDefinitionResponse.from_json(json_object: response.body)
      end
# Deletes a customer-related [custom attribute
#  definition](entity:CustomAttributeDefinition) from a Square seller account.
#  Deleting a custom attribute definition also deletes the corresponding custom
#  attribute from
#  all customer profiles in the seller's Customer Directory.
#  Only the definition owner can delete a custom attribute definition.
      #
      # @param key [String] The key of the custom attribute definition to delete.
      # @param request_options [square.rb::RequestOptions] 
      # @return [square.rb::DeleteCustomerCustomAttributeDefinitionResponse]
      # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.customers.custom_attribute_definitions.delete(key: "key")
      def delete(key:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/customers/custom-attribute-definitions/#{key}"
end
        square.rb::DeleteCustomerCustomAttributeDefinitionResponse.from_json(json_object: response.body)
      end
# Creates or updates [custom attributes](entity:CustomAttribute) for customer
#  profiles as a bulk operation.
#  Use this endpoint to set the value of one or more custom attributes for one or
#  more customer profiles.
#  A custom attribute is based on a custom attribute definition in a Square seller
#  account, which is
#  created using the
#  ](api-endpoint:CustomerCustomAttributes-CreateCustomerCustomAttributeDefinition)
#  endpoint.
#  This `BulkUpsertCustomerCustomAttributes` endpoint accepts a map of 1 to 25
#  individual upsert
#  requests and returns a map of individual upsert responses. Each upsert request
#  has a unique ID
#  and provides a customer ID and custom attribute. Each upsert response is
#  returned with the ID
#  of the corresponding request.
#  To create or update a custom attribute owned by another application, the
#  `visibility` setting
#  must be `VISIBILITY_READ_WRITE_VALUES`. Note that seller-defined custom
#  attributes
#  (also known as custom fields) are always set to `VISIBILITY_READ_WRITE_VALUES`.
      #
      # @param values [Hash{String => square.rb::BatchUpsertCustomerCustomAttributesRequestCustomerCustomAttributeUpsertRequest}] A map containing 1 to 25 individual upsert requests. For each request, provide
#  an
#  arbitrary ID that is unique for this `BulkUpsertCustomerCustomAttributes`
#  request and the
#  information needed to create or update a custom attribute.
      # @param request_options [square.rb::RequestOptions] 
      # @return [square.rb::BatchUpsertCustomerCustomAttributesResponse]
      # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.customers.custom_attribute_definitions.batch_upsert(values: { "id1": { customer_id: "N3NCVYY3WS27HF0HKANA3R9FP8", custom_attribute: { key: "favoritemovie", value: "Dune" } }, "id2": { customer_id: "SY8EMWRNDN3TQDP2H4KS1QWMMM", custom_attribute: { key: "ownsmovie", value: false } }, "id3": { customer_id: "SY8EMWRNDN3TQDP2H4KS1QWMMM", custom_attribute: { key: "favoritemovie", value: "Star Wars" } }, "id4": { customer_id: "N3NCVYY3WS27HF0HKANA3R9FP8", custom_attribute: { key: "square:a0f1505a-2aa1-490d-91a8-8d31ff181808", value: "10.5" } }, "id5": { customer_id: "70548QG1HN43B05G0KCZ4MMC1G", custom_attribute: { key: "sq0ids-0evKIskIGaY45fCyNL66aw:backupemail", value: "fake-email@squareup.com" } } })
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
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/customers/custom-attributes/bulk-upsert"
end
        square.rb::BatchUpsertCustomerCustomAttributesResponse.from_json(json_object: response.body)
      end
    end
    class AsyncCustomAttributeDefinitionsClient
    # @return [square.rb::AsyncRequestClient] 
      attr_reader :request_client


      # @param request_client [square.rb::RequestClient] 
      # @return [square.rb::Customers::AsyncCustomAttributeDefinitionsClient]
      def initialize(request_client:)
        @request_client = request_client
      end
# Lists the customer-related [custom attribute
#  definitions](entity:CustomAttributeDefinition) that belong to a Square seller
#  account.
#  When all response pages are retrieved, the results include all custom attribute
#  definitions
#  that are visible to the requesting application, including those that are created
#  by other
#  applications and set to `VISIBILITY_READ_ONLY` or
#  `VISIBILITY_READ_WRITE_VALUES`. Note that
#  seller-defined custom attributes (also known as custom fields) are always set to
#  `VISIBILITY_READ_WRITE_VALUES`.
      #
      # @param limit [Integer] The maximum number of results to return in a single paged response. This limit
#  is advisory.
#  The response might contain more or fewer results. The minimum value is 1 and the
#  maximum value is 100.
#  The default value is 20. For more information, see
#  ttps://developer.squareup.com/docs/build-basics/common-api-patterns/pagination).
      # @param cursor [String] The cursor returned in the paged response from the previous call to this
#  endpoint.
#  Provide this cursor to retrieve the next page of results for your original
#  request.
#  For more information, see
#  ttps://developer.squareup.com/docs/build-basics/common-api-patterns/pagination).
      # @param request_options [square.rb::RequestOptions] 
      # @return [square.rb::ListCustomerCustomAttributeDefinitionsResponse]
      # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.customers.custom_attribute_definitions.list
      def list(limit: nil, cursor: nil, request_options: nil)
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
  req.params = { **(request_options&.additional_query_parameters || {}), "limit": limit, "cursor": cursor }.compact
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/customers/custom-attribute-definitions"
end
          square.rb::ListCustomerCustomAttributeDefinitionsResponse.from_json(json_object: response.body)
        end
      end
# Creates a customer-related [custom attribute
#  definition](entity:CustomAttributeDefinition) for a Square seller account.
#  Use this endpoint to define a custom attribute that can be associated with
#  customer profiles.
#  A custom attribute definition specifies the `key`, `visibility`, `schema`, and
#  other properties
#  for a custom attribute. After the definition is created, you can call
#  mAttribute](api-endpoint:CustomerCustomAttributes-UpsertCustomerCustomAttribute)
#  or
#  butes](api-endpoint:CustomerCustomAttributes-BulkUpsertCustomerCustomAttributes)
#  to set the custom attribute for customer profiles in the seller's Customer
#  Directory.
#  Sellers can view all custom attributes in exported customer data, including
#  those set to
#  `VISIBILITY_HIDDEN`.
      #
      # @param custom_attribute_definition [Hash] The custom attribute definition to create. Note the following:
#  - With the exception of the `Selection` data type, the `schema` is specified as
#  a simple URL to the JSON schema
#  definition hosted on the Square CDN. For more information, including supported
#  values and constraints, see
#  [Specifying the
#  ocs/customer-custom-attributes-api/custom-attribute-definitions#specify-schema).
#  - If provided, `name` must be unique (case-sensitive) across all visible
#  customer-related custom attribute definitions for the seller.
#  - All custom attributes are visible in exported customer data, including those
#  set to `VISIBILITY_HIDDEN`.Request of type square.rb::CustomAttributeDefinition, as a Hash
      #   * :key (String) 
      #   * :schema (Hash{String => Object}) 
      #   * :name (String) 
      #   * :description (String) 
      #   * :visibility (square.rb::CustomAttributeDefinitionVisibility) 
      #   * :version (Integer) 
      #   * :updated_at (String) 
      #   * :created_at (String) 
      # @param idempotency_key [String] A unique identifier for this request, used to ensure idempotency. For more
#  information,
#  see
#  tps://developer.squareup.com/docs/build-basics/common-api-patterns/idempotency).
      # @param request_options [square.rb::RequestOptions] 
      # @return [square.rb::CreateCustomerCustomAttributeDefinitionResponse]
      # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.customers.custom_attribute_definitions.create(custom_attribute_definition: { key: "favoritemovie", schema: { "ref": "https://developer-production-s.squarecdn.com/schemas/v1/common.json#squareup.common.String" }, name: "Favorite Movie", description: "The favorite movie of the customer.", visibility: VISIBILITY_HIDDEN })
      def create(custom_attribute_definition:, idempotency_key: nil, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), custom_attribute_definition: custom_attribute_definition, idempotency_key: idempotency_key }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/customers/custom-attribute-definitions"
end
          square.rb::CreateCustomerCustomAttributeDefinitionResponse.from_json(json_object: response.body)
        end
      end
# Retrieves a customer-related [custom attribute
#  definition](entity:CustomAttributeDefinition) from a Square seller account.
#  To retrieve a custom attribute definition created by another application, the
#  `visibility`
#  setting must be `VISIBILITY_READ_ONLY` or `VISIBILITY_READ_WRITE_VALUES`. Note
#  that seller-defined custom attributes
#  (also known as custom fields) are always set to `VISIBILITY_READ_WRITE_VALUES`.
      #
      # @param key [String] The key of the custom attribute definition to retrieve. If the requesting
#  application
#  is not the definition owner, you must use the qualified key.
      # @param version [Integer] The current version of the custom attribute definition, which is used for
#  strongly consistent
#  reads to guarantee that you receive the most up-to-date data. When included in
#  the request,
#  Square returns the specified version or a higher version if one exists. If the
#  specified version
#  is higher than the current version, Square returns a `BAD_REQUEST` error.
      # @param request_options [square.rb::RequestOptions] 
      # @return [square.rb::GetCustomerCustomAttributeDefinitionResponse]
      # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.customers.custom_attribute_definitions.get(key: "key")
      def get(key:, version: nil, request_options: nil)
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
  req.params = { **(request_options&.additional_query_parameters || {}), "version": version }.compact
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/customers/custom-attribute-definitions/#{key}"
end
          square.rb::GetCustomerCustomAttributeDefinitionResponse.from_json(json_object: response.body)
        end
      end
# Updates a customer-related [custom attribute
#  definition](entity:CustomAttributeDefinition) for a Square seller account.
#  Use this endpoint to update the following fields: `name`, `description`,
#  `visibility`, or the
#  `schema` for a `Selection` data type.
#  Only the definition owner can update a custom attribute definition. Note that
#  sellers can view
#  all custom attributes in exported customer data, including those set to
#  `VISIBILITY_HIDDEN`.
      #
      # @param key [String] The key of the custom attribute definition to update.
      # @param custom_attribute_definition [Hash] The custom attribute definition that contains the fields to update. This
#  endpoint
#  supports sparse updates, so only new or changed fields need to be included in
#  the request.
#  Only the following fields can be updated:
#  - `name`
#  - `description`
#  - `visibility`
#  - `schema` for a `Selection` data type. Only changes to the named options or the
#  maximum number of allowed
#  selections are supported.
#  For more information, see
#  [Updatable definition
#  custom-attributes-api/custom-attribute-definitions#updatable-definition-fields).
#  To enable [optimistic
#  loper.squareup.com/docs/build-basics/common-api-patterns/optimistic-concurrency)
#  control, include the optional `version` field and specify the current version of
#  the custom attribute definition.Request of type square.rb::CustomAttributeDefinition, as a Hash
      #   * :key (String) 
      #   * :schema (Hash{String => Object}) 
      #   * :name (String) 
      #   * :description (String) 
      #   * :visibility (square.rb::CustomAttributeDefinitionVisibility) 
      #   * :version (Integer) 
      #   * :updated_at (String) 
      #   * :created_at (String) 
      # @param idempotency_key [String] A unique identifier for this request, used to ensure idempotency. For more
#  information,
#  see
#  tps://developer.squareup.com/docs/build-basics/common-api-patterns/idempotency).
      # @param request_options [square.rb::RequestOptions] 
      # @return [square.rb::UpdateCustomerCustomAttributeDefinitionResponse]
      # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.customers.custom_attribute_definitions.update(key: "key", custom_attribute_definition: { description: "Update the description as desired.", visibility: VISIBILITY_READ_ONLY })
      def update(key:, custom_attribute_definition:, idempotency_key: nil, request_options: nil)
        Async do
          response = @request_client.conn.put do | req |
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
  req.body = { **(request_options&.additional_body_parameters || {}), custom_attribute_definition: custom_attribute_definition, idempotency_key: idempotency_key }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/customers/custom-attribute-definitions/#{key}"
end
          square.rb::UpdateCustomerCustomAttributeDefinitionResponse.from_json(json_object: response.body)
        end
      end
# Deletes a customer-related [custom attribute
#  definition](entity:CustomAttributeDefinition) from a Square seller account.
#  Deleting a custom attribute definition also deletes the corresponding custom
#  attribute from
#  all customer profiles in the seller's Customer Directory.
#  Only the definition owner can delete a custom attribute definition.
      #
      # @param key [String] The key of the custom attribute definition to delete.
      # @param request_options [square.rb::RequestOptions] 
      # @return [square.rb::DeleteCustomerCustomAttributeDefinitionResponse]
      # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.customers.custom_attribute_definitions.delete(key: "key")
      def delete(key:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/customers/custom-attribute-definitions/#{key}"
end
          square.rb::DeleteCustomerCustomAttributeDefinitionResponse.from_json(json_object: response.body)
        end
      end
# Creates or updates [custom attributes](entity:CustomAttribute) for customer
#  profiles as a bulk operation.
#  Use this endpoint to set the value of one or more custom attributes for one or
#  more customer profiles.
#  A custom attribute is based on a custom attribute definition in a Square seller
#  account, which is
#  created using the
#  ](api-endpoint:CustomerCustomAttributes-CreateCustomerCustomAttributeDefinition)
#  endpoint.
#  This `BulkUpsertCustomerCustomAttributes` endpoint accepts a map of 1 to 25
#  individual upsert
#  requests and returns a map of individual upsert responses. Each upsert request
#  has a unique ID
#  and provides a customer ID and custom attribute. Each upsert response is
#  returned with the ID
#  of the corresponding request.
#  To create or update a custom attribute owned by another application, the
#  `visibility` setting
#  must be `VISIBILITY_READ_WRITE_VALUES`. Note that seller-defined custom
#  attributes
#  (also known as custom fields) are always set to `VISIBILITY_READ_WRITE_VALUES`.
      #
      # @param values [Hash{String => square.rb::BatchUpsertCustomerCustomAttributesRequestCustomerCustomAttributeUpsertRequest}] A map containing 1 to 25 individual upsert requests. For each request, provide
#  an
#  arbitrary ID that is unique for this `BulkUpsertCustomerCustomAttributes`
#  request and the
#  information needed to create or update a custom attribute.
      # @param request_options [square.rb::RequestOptions] 
      # @return [square.rb::BatchUpsertCustomerCustomAttributesResponse]
      # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.customers.custom_attribute_definitions.batch_upsert(values: { "id1": { customer_id: "N3NCVYY3WS27HF0HKANA3R9FP8", custom_attribute: { key: "favoritemovie", value: "Dune" } }, "id2": { customer_id: "SY8EMWRNDN3TQDP2H4KS1QWMMM", custom_attribute: { key: "ownsmovie", value: false } }, "id3": { customer_id: "SY8EMWRNDN3TQDP2H4KS1QWMMM", custom_attribute: { key: "favoritemovie", value: "Star Wars" } }, "id4": { customer_id: "N3NCVYY3WS27HF0HKANA3R9FP8", custom_attribute: { key: "square:a0f1505a-2aa1-490d-91a8-8d31ff181808", value: "10.5" } }, "id5": { customer_id: "70548QG1HN43B05G0KCZ4MMC1G", custom_attribute: { key: "sq0ids-0evKIskIGaY45fCyNL66aw:backupemail", value: "fake-email@squareup.com" } } })
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
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/customers/custom-attributes/bulk-upsert"
end
          square.rb::BatchUpsertCustomerCustomAttributesResponse.from_json(json_object: response.body)
        end
      end
    end
  end
end