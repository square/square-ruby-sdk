# frozen_string_literal: true
require_relative "../../../requests"
require_relative "../../types/visibility_filter"
require_relative "../../types/list_merchant_custom_attribute_definitions_response"
require_relative "../../types/custom_attribute_definition"
require_relative "../../types/create_merchant_custom_attribute_definition_response"
require_relative "../../types/retrieve_merchant_custom_attribute_definition_response"
require_relative "../../types/update_merchant_custom_attribute_definition_response"
require_relative "../../types/delete_merchant_custom_attribute_definition_response"
require "async"
require "async"
require "async"
require "async"
require "async"
require_relative "../../../requests"

module square.rb
  module Merchants
    class CustomAttributeDefinitionsClient
    # @return [square.rb::RequestClient] 
      attr_reader :request_client


      # @param request_client [square.rb::RequestClient] 
      # @return [square.rb::Merchants::CustomAttributeDefinitionsClient]
      def initialize(request_client:)
        @request_client = request_client
      end
# Lists the merchant-related [custom attribute
#  definitions](entity:CustomAttributeDefinition) that belong to a Square seller
#  account.
#  When all response pages are retrieved, the results include all custom attribute
#  definitions
#  that are visible to the requesting application, including those that are created
#  by other
#  applications and set to `VISIBILITY_READ_ONLY` or
#  `VISIBILITY_READ_WRITE_VALUES`.
      #
      # @param visibility_filter [square.rb::VisibilityFilter] Filters the `CustomAttributeDefinition` results by their `visibility` values.
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
      # @return [square.rb::ListMerchantCustomAttributeDefinitionsResponse]
      # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.merchants.custom_attribute_definitions.list
      def list(visibility_filter: nil, limit: nil, cursor: nil, request_options: nil)
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
  req.params = { **(request_options&.additional_query_parameters || {}), "visibility_filter": visibility_filter, "limit": limit, "cursor": cursor }.compact
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/merchants/custom-attribute-definitions"
end
        square.rb::ListMerchantCustomAttributeDefinitionsResponse.from_json(json_object: response.body)
      end
# Creates a merchant-related [custom attribute
#  definition](entity:CustomAttributeDefinition) for a Square seller account.
#  Use this endpoint to define a custom attribute that can be associated with a
#  merchant connecting to your application.
#  A custom attribute definition specifies the `key`, `visibility`, `schema`, and
#  other properties
#  for a custom attribute. After the definition is created, you can call
#  mAttribute](api-endpoint:MerchantCustomAttributes-UpsertMerchantCustomAttribute)
#  or
#  butes](api-endpoint:MerchantCustomAttributes-BulkUpsertMerchantCustomAttributes)
#  to set the custom attribute for a merchant.
      #
      # @param custom_attribute_definition [Hash] The custom attribute definition to create. Note the following:
#  - With the exception of the `Selection` data type, the `schema` is specified as
#  a simple URL to the JSON schema
#  definition hosted on the Square CDN. For more information, including supported
#  values and constraints, see
#  [Supported data
#  oper.squareup.com/docs/devtools/customattributes/overview#supported-data-types).
#  - `name` is required unless `visibility` is set to `VISIBILITY_HIDDEN`.Request of type square.rb::CustomAttributeDefinition, as a Hash
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
      # @return [square.rb::CreateMerchantCustomAttributeDefinitionResponse]
      # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.merchants.custom_attribute_definitions.create(custom_attribute_definition: { key: "alternative_seller_name", schema: { "ref": "https://developer-production-s.squarecdn.com/schemas/v1/common.json#squareup.common.String" }, name: "Alternative Merchant Name", description: "This is the other name this merchant goes by.", visibility: VISIBILITY_READ_ONLY })
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
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/merchants/custom-attribute-definitions"
end
        square.rb::CreateMerchantCustomAttributeDefinitionResponse.from_json(json_object: response.body)
      end
# Retrieves a merchant-related [custom attribute
#  definition](entity:CustomAttributeDefinition) from a Square seller account.
#  To retrieve a custom attribute definition created by another application, the
#  `visibility`
#  setting must be `VISIBILITY_READ_ONLY` or `VISIBILITY_READ_WRITE_VALUES`.
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
      # @return [square.rb::RetrieveMerchantCustomAttributeDefinitionResponse]
      # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.merchants.custom_attribute_definitions.get(key: "key")
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
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/merchants/custom-attribute-definitions/#{key}"
end
        square.rb::RetrieveMerchantCustomAttributeDefinitionResponse.from_json(json_object: response.body)
      end
# Updates a merchant-related [custom attribute
#  definition](entity:CustomAttributeDefinition) for a Square seller account.
#  Use this endpoint to update the following fields: `name`, `description`,
#  `visibility`, or the
#  `schema` for a `Selection` data type.
#  Only the definition owner can update a custom attribute definition.
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
#  [Update a merchant custom attribute
#  attributes-api/custom-attribute-definitions#update-custom-attribute-definition).
#  The version field must match the current version of the custom attribute
#  definition to enable
#  [optimistic
#  loper.squareup.com/docs/build-basics/common-api-patterns/optimistic-concurrency)
#  If this is not important for your application, version can be set to -1. For any
#  other values, the request fails with a BAD_REQUEST error.Request of type square.rb::CustomAttributeDefinition, as a Hash
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
      # @return [square.rb::UpdateMerchantCustomAttributeDefinitionResponse]
      # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.merchants.custom_attribute_definitions.update(key: "key", custom_attribute_definition: { description: "Update the description as desired.", visibility: VISIBILITY_READ_ONLY })
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
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/merchants/custom-attribute-definitions/#{key}"
end
        square.rb::UpdateMerchantCustomAttributeDefinitionResponse.from_json(json_object: response.body)
      end
# Deletes a merchant-related [custom attribute
#  definition](entity:CustomAttributeDefinition) from a Square seller account.
#  Deleting a custom attribute definition also deletes the corresponding custom
#  attribute from
#  the merchant.
#  Only the definition owner can delete a custom attribute definition.
      #
      # @param key [String] The key of the custom attribute definition to delete.
      # @param request_options [square.rb::RequestOptions] 
      # @return [square.rb::DeleteMerchantCustomAttributeDefinitionResponse]
      # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.merchants.custom_attribute_definitions.delete(key: "key")
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
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/merchants/custom-attribute-definitions/#{key}"
end
        square.rb::DeleteMerchantCustomAttributeDefinitionResponse.from_json(json_object: response.body)
      end
    end
    class AsyncCustomAttributeDefinitionsClient
    # @return [square.rb::AsyncRequestClient] 
      attr_reader :request_client


      # @param request_client [square.rb::RequestClient] 
      # @return [square.rb::Merchants::AsyncCustomAttributeDefinitionsClient]
      def initialize(request_client:)
        @request_client = request_client
      end
# Lists the merchant-related [custom attribute
#  definitions](entity:CustomAttributeDefinition) that belong to a Square seller
#  account.
#  When all response pages are retrieved, the results include all custom attribute
#  definitions
#  that are visible to the requesting application, including those that are created
#  by other
#  applications and set to `VISIBILITY_READ_ONLY` or
#  `VISIBILITY_READ_WRITE_VALUES`.
      #
      # @param visibility_filter [square.rb::VisibilityFilter] Filters the `CustomAttributeDefinition` results by their `visibility` values.
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
      # @return [square.rb::ListMerchantCustomAttributeDefinitionsResponse]
      # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.merchants.custom_attribute_definitions.list
      def list(visibility_filter: nil, limit: nil, cursor: nil, request_options: nil)
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
  req.params = { **(request_options&.additional_query_parameters || {}), "visibility_filter": visibility_filter, "limit": limit, "cursor": cursor }.compact
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/merchants/custom-attribute-definitions"
end
          square.rb::ListMerchantCustomAttributeDefinitionsResponse.from_json(json_object: response.body)
        end
      end
# Creates a merchant-related [custom attribute
#  definition](entity:CustomAttributeDefinition) for a Square seller account.
#  Use this endpoint to define a custom attribute that can be associated with a
#  merchant connecting to your application.
#  A custom attribute definition specifies the `key`, `visibility`, `schema`, and
#  other properties
#  for a custom attribute. After the definition is created, you can call
#  mAttribute](api-endpoint:MerchantCustomAttributes-UpsertMerchantCustomAttribute)
#  or
#  butes](api-endpoint:MerchantCustomAttributes-BulkUpsertMerchantCustomAttributes)
#  to set the custom attribute for a merchant.
      #
      # @param custom_attribute_definition [Hash] The custom attribute definition to create. Note the following:
#  - With the exception of the `Selection` data type, the `schema` is specified as
#  a simple URL to the JSON schema
#  definition hosted on the Square CDN. For more information, including supported
#  values and constraints, see
#  [Supported data
#  oper.squareup.com/docs/devtools/customattributes/overview#supported-data-types).
#  - `name` is required unless `visibility` is set to `VISIBILITY_HIDDEN`.Request of type square.rb::CustomAttributeDefinition, as a Hash
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
      # @return [square.rb::CreateMerchantCustomAttributeDefinitionResponse]
      # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.merchants.custom_attribute_definitions.create(custom_attribute_definition: { key: "alternative_seller_name", schema: { "ref": "https://developer-production-s.squarecdn.com/schemas/v1/common.json#squareup.common.String" }, name: "Alternative Merchant Name", description: "This is the other name this merchant goes by.", visibility: VISIBILITY_READ_ONLY })
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
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/merchants/custom-attribute-definitions"
end
          square.rb::CreateMerchantCustomAttributeDefinitionResponse.from_json(json_object: response.body)
        end
      end
# Retrieves a merchant-related [custom attribute
#  definition](entity:CustomAttributeDefinition) from a Square seller account.
#  To retrieve a custom attribute definition created by another application, the
#  `visibility`
#  setting must be `VISIBILITY_READ_ONLY` or `VISIBILITY_READ_WRITE_VALUES`.
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
      # @return [square.rb::RetrieveMerchantCustomAttributeDefinitionResponse]
      # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.merchants.custom_attribute_definitions.get(key: "key")
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
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/merchants/custom-attribute-definitions/#{key}"
end
          square.rb::RetrieveMerchantCustomAttributeDefinitionResponse.from_json(json_object: response.body)
        end
      end
# Updates a merchant-related [custom attribute
#  definition](entity:CustomAttributeDefinition) for a Square seller account.
#  Use this endpoint to update the following fields: `name`, `description`,
#  `visibility`, or the
#  `schema` for a `Selection` data type.
#  Only the definition owner can update a custom attribute definition.
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
#  [Update a merchant custom attribute
#  attributes-api/custom-attribute-definitions#update-custom-attribute-definition).
#  The version field must match the current version of the custom attribute
#  definition to enable
#  [optimistic
#  loper.squareup.com/docs/build-basics/common-api-patterns/optimistic-concurrency)
#  If this is not important for your application, version can be set to -1. For any
#  other values, the request fails with a BAD_REQUEST error.Request of type square.rb::CustomAttributeDefinition, as a Hash
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
      # @return [square.rb::UpdateMerchantCustomAttributeDefinitionResponse]
      # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.merchants.custom_attribute_definitions.update(key: "key", custom_attribute_definition: { description: "Update the description as desired.", visibility: VISIBILITY_READ_ONLY })
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
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/merchants/custom-attribute-definitions/#{key}"
end
          square.rb::UpdateMerchantCustomAttributeDefinitionResponse.from_json(json_object: response.body)
        end
      end
# Deletes a merchant-related [custom attribute
#  definition](entity:CustomAttributeDefinition) from a Square seller account.
#  Deleting a custom attribute definition also deletes the corresponding custom
#  attribute from
#  the merchant.
#  Only the definition owner can delete a custom attribute definition.
      #
      # @param key [String] The key of the custom attribute definition to delete.
      # @param request_options [square.rb::RequestOptions] 
      # @return [square.rb::DeleteMerchantCustomAttributeDefinitionResponse]
      # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.merchants.custom_attribute_definitions.delete(key: "key")
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
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/merchants/custom-attribute-definitions/#{key}"
end
          square.rb::DeleteMerchantCustomAttributeDefinitionResponse.from_json(json_object: response.body)
        end
      end
    end
  end
end