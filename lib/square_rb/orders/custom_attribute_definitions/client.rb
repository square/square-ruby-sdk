# frozen_string_literal: true
require_relative "../../../requests"
require_relative "../../types/visibility_filter"
require_relative "../../types/list_order_custom_attribute_definitions_response"
require_relative "../../types/custom_attribute_definition"
require_relative "../../types/create_order_custom_attribute_definition_response"
require_relative "../../types/retrieve_order_custom_attribute_definition_response"
require_relative "../../types/update_order_custom_attribute_definition_response"
require_relative "../../types/delete_order_custom_attribute_definition_response"
require "async"
require "async"
require "async"
require "async"
require "async"
require_relative "../../../requests"

module SquareApiClient
  module Orders
    class CustomAttributeDefinitionsClient
    # @return [SquareApiClient::RequestClient] 
      attr_reader :request_client


      # @param request_client [SquareApiClient::RequestClient] 
      # @return [SquareApiClient::Orders::CustomAttributeDefinitionsClient]
      def initialize(request_client:)
        @request_client = request_client
      end
# Lists the order-related [custom attribute
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
      # @param visibility_filter [SquareApiClient::VisibilityFilter] Requests that all of the custom attributes be returned, or only those that are
#  read-only or read-write.
      # @param cursor [String] The cursor returned in the paged response from the previous call to this
#  endpoint.
#  Provide this cursor to retrieve the next page of results for your original
#  request.
#  For more information, see
#  [Pagination](https://developer.squareup.com/docs/working-with-apis/pagination).
      # @param limit [Integer] The maximum number of results to return in a single paged response. This limit
#  is advisory.
#  The response might contain more or fewer results. The minimum value is 1 and the
#  maximum value is 100.
#  The default value is 20.
#  For more information, see
#  [Pagination](https://developer.squareup.com/docs/working-with-apis/pagination).
      # @param request_options [SquareApiClient::RequestOptions] 
      # @return [SquareApiClient::ListOrderCustomAttributeDefinitionsResponse]
      # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.orders.custom_attribute_definitions.list
      def list(visibility_filter: nil, cursor: nil, limit: nil, request_options: nil)
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
  req.params = { **(request_options&.additional_query_parameters || {}), "visibility_filter": visibility_filter, "cursor": cursor, "limit": limit }.compact
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/orders/custom-attribute-definitions"
end
        SquareApiClient::ListOrderCustomAttributeDefinitionsResponse.from_json(json_object: response.body)
      end
# Creates an order-related custom attribute definition.  Use this endpoint to
#  define a custom attribute that can be associated with orders.
#  After creating a custom attribute definition, you can set the custom attribute
#  for orders
#  in the Square seller account.
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
#  set to `VISIBILITY_HIDDEN`.Request of type SquareApiClient::CustomAttributeDefinition, as a Hash
      #   * :key (String) 
      #   * :schema (Hash{String => Object}) 
      #   * :name (String) 
      #   * :description (String) 
      #   * :visibility (SquareApiClient::CustomAttributeDefinitionVisibility) 
      #   * :version (Integer) 
      #   * :updated_at (String) 
      #   * :created_at (String) 
      # @param idempotency_key [String] A unique identifier for this request, used to ensure idempotency.
#  For more information, see
#  tps://developer.squareup.com/docs/build-basics/common-api-patterns/idempotency).
      # @param request_options [SquareApiClient::RequestOptions] 
      # @return [SquareApiClient::CreateOrderCustomAttributeDefinitionResponse]
      # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.orders.custom_attribute_definitions.create(custom_attribute_definition: { key: "cover-count", schema: { "ref": "https://developer-production-s.squarecdn.com/schemas/v1/common.json#squareup.common.Number" }, name: "Cover count", description: "The number of people seated at a table", visibility: VISIBILITY_READ_WRITE_VALUES }, idempotency_key: "IDEMPOTENCY_KEY")
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
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/orders/custom-attribute-definitions"
end
        SquareApiClient::CreateOrderCustomAttributeDefinitionResponse.from_json(json_object: response.body)
      end
# Retrieves an order-related [custom attribute
#  definition](entity:CustomAttributeDefinition) from a Square seller account.
#  To retrieve a custom attribute definition created by another application, the
#  `visibility`
#  setting must be `VISIBILITY_READ_ONLY` or `VISIBILITY_READ_WRITE_VALUES`. Note
#  that seller-defined custom attributes
#  (also known as custom fields) are always set to `VISIBILITY_READ_WRITE_VALUES`.
      #
      # @param key [String] The key of the custom attribute definition to retrieve.
      # @param version [Integer] To enable [optimistic
#  loper.squareup.com/docs/build-basics/common-api-patterns/optimistic-concurrency)
#  control, include this optional field and specify the current version of the
#  custom attribute.
      # @param request_options [SquareApiClient::RequestOptions] 
      # @return [SquareApiClient::RetrieveOrderCustomAttributeDefinitionResponse]
      # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.orders.custom_attribute_definitions.get(key: "key")
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
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/orders/custom-attribute-definitions/#{key}"
end
        SquareApiClient::RetrieveOrderCustomAttributeDefinitionResponse.from_json(json_object: response.body)
      end
# Updates an order-related custom attribute definition for a Square seller
#  account.
#  Only the definition owner can update a custom attribute definition. Note that
#  sellers can view all custom attributes in exported customer data, including
#  those set to `VISIBILITY_HIDDEN`.
      #
      # @param key [String] The key of the custom attribute definition to update.
      # @param custom_attribute_definition [Hash] The custom attribute definition that contains the fields to update. This
#  endpoint supports sparse updates,
#  so only new or changed fields need to be included in the request.  For more
#  information, see
#  [Updatable definition
#  custom-attributes-api/custom-attribute-definitions#updatable-definition-fields).
#  To enable [optimistic
#  loper.squareup.com/docs/build-basics/common-api-patterns/optimistic-concurrency)
#  control, include the optional `version` field and specify the current version of
#  the custom attribute definition.Request of type SquareApiClient::CustomAttributeDefinition, as a Hash
      #   * :key (String) 
      #   * :schema (Hash{String => Object}) 
      #   * :name (String) 
      #   * :description (String) 
      #   * :visibility (SquareApiClient::CustomAttributeDefinitionVisibility) 
      #   * :version (Integer) 
      #   * :updated_at (String) 
      #   * :created_at (String) 
      # @param idempotency_key [String] A unique identifier for this request, used to ensure idempotency.
#  For more information, see
#  tps://developer.squareup.com/docs/build-basics/common-api-patterns/idempotency).
      # @param request_options [SquareApiClient::RequestOptions] 
      # @return [SquareApiClient::UpdateOrderCustomAttributeDefinitionResponse]
      # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.orders.custom_attribute_definitions.update(
#    key: "key",
#    custom_attribute_definition: { key: "cover-count", visibility: VISIBILITY_READ_ONLY, version: 1 },
#    idempotency_key: "IDEMPOTENCY_KEY"
#  )
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
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/orders/custom-attribute-definitions/#{key}"
end
        SquareApiClient::UpdateOrderCustomAttributeDefinitionResponse.from_json(json_object: response.body)
      end
# Deletes an order-related [custom attribute
#  definition](entity:CustomAttributeDefinition) from a Square seller account.
#  Only the definition owner can delete a custom attribute definition.
      #
      # @param key [String] The key of the custom attribute definition to delete.
      # @param request_options [SquareApiClient::RequestOptions] 
      # @return [SquareApiClient::DeleteOrderCustomAttributeDefinitionResponse]
      # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.orders.custom_attribute_definitions.delete(key: "key")
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
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/orders/custom-attribute-definitions/#{key}"
end
        SquareApiClient::DeleteOrderCustomAttributeDefinitionResponse.from_json(json_object: response.body)
      end
    end
    class AsyncCustomAttributeDefinitionsClient
    # @return [SquareApiClient::AsyncRequestClient] 
      attr_reader :request_client


      # @param request_client [SquareApiClient::RequestClient] 
      # @return [SquareApiClient::Orders::AsyncCustomAttributeDefinitionsClient]
      def initialize(request_client:)
        @request_client = request_client
      end
# Lists the order-related [custom attribute
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
      # @param visibility_filter [SquareApiClient::VisibilityFilter] Requests that all of the custom attributes be returned, or only those that are
#  read-only or read-write.
      # @param cursor [String] The cursor returned in the paged response from the previous call to this
#  endpoint.
#  Provide this cursor to retrieve the next page of results for your original
#  request.
#  For more information, see
#  [Pagination](https://developer.squareup.com/docs/working-with-apis/pagination).
      # @param limit [Integer] The maximum number of results to return in a single paged response. This limit
#  is advisory.
#  The response might contain more or fewer results. The minimum value is 1 and the
#  maximum value is 100.
#  The default value is 20.
#  For more information, see
#  [Pagination](https://developer.squareup.com/docs/working-with-apis/pagination).
      # @param request_options [SquareApiClient::RequestOptions] 
      # @return [SquareApiClient::ListOrderCustomAttributeDefinitionsResponse]
      # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.orders.custom_attribute_definitions.list
      def list(visibility_filter: nil, cursor: nil, limit: nil, request_options: nil)
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
  req.params = { **(request_options&.additional_query_parameters || {}), "visibility_filter": visibility_filter, "cursor": cursor, "limit": limit }.compact
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/orders/custom-attribute-definitions"
end
          SquareApiClient::ListOrderCustomAttributeDefinitionsResponse.from_json(json_object: response.body)
        end
      end
# Creates an order-related custom attribute definition.  Use this endpoint to
#  define a custom attribute that can be associated with orders.
#  After creating a custom attribute definition, you can set the custom attribute
#  for orders
#  in the Square seller account.
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
#  set to `VISIBILITY_HIDDEN`.Request of type SquareApiClient::CustomAttributeDefinition, as a Hash
      #   * :key (String) 
      #   * :schema (Hash{String => Object}) 
      #   * :name (String) 
      #   * :description (String) 
      #   * :visibility (SquareApiClient::CustomAttributeDefinitionVisibility) 
      #   * :version (Integer) 
      #   * :updated_at (String) 
      #   * :created_at (String) 
      # @param idempotency_key [String] A unique identifier for this request, used to ensure idempotency.
#  For more information, see
#  tps://developer.squareup.com/docs/build-basics/common-api-patterns/idempotency).
      # @param request_options [SquareApiClient::RequestOptions] 
      # @return [SquareApiClient::CreateOrderCustomAttributeDefinitionResponse]
      # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.orders.custom_attribute_definitions.create(custom_attribute_definition: { key: "cover-count", schema: { "ref": "https://developer-production-s.squarecdn.com/schemas/v1/common.json#squareup.common.Number" }, name: "Cover count", description: "The number of people seated at a table", visibility: VISIBILITY_READ_WRITE_VALUES }, idempotency_key: "IDEMPOTENCY_KEY")
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
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/orders/custom-attribute-definitions"
end
          SquareApiClient::CreateOrderCustomAttributeDefinitionResponse.from_json(json_object: response.body)
        end
      end
# Retrieves an order-related [custom attribute
#  definition](entity:CustomAttributeDefinition) from a Square seller account.
#  To retrieve a custom attribute definition created by another application, the
#  `visibility`
#  setting must be `VISIBILITY_READ_ONLY` or `VISIBILITY_READ_WRITE_VALUES`. Note
#  that seller-defined custom attributes
#  (also known as custom fields) are always set to `VISIBILITY_READ_WRITE_VALUES`.
      #
      # @param key [String] The key of the custom attribute definition to retrieve.
      # @param version [Integer] To enable [optimistic
#  loper.squareup.com/docs/build-basics/common-api-patterns/optimistic-concurrency)
#  control, include this optional field and specify the current version of the
#  custom attribute.
      # @param request_options [SquareApiClient::RequestOptions] 
      # @return [SquareApiClient::RetrieveOrderCustomAttributeDefinitionResponse]
      # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.orders.custom_attribute_definitions.get(key: "key")
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
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/orders/custom-attribute-definitions/#{key}"
end
          SquareApiClient::RetrieveOrderCustomAttributeDefinitionResponse.from_json(json_object: response.body)
        end
      end
# Updates an order-related custom attribute definition for a Square seller
#  account.
#  Only the definition owner can update a custom attribute definition. Note that
#  sellers can view all custom attributes in exported customer data, including
#  those set to `VISIBILITY_HIDDEN`.
      #
      # @param key [String] The key of the custom attribute definition to update.
      # @param custom_attribute_definition [Hash] The custom attribute definition that contains the fields to update. This
#  endpoint supports sparse updates,
#  so only new or changed fields need to be included in the request.  For more
#  information, see
#  [Updatable definition
#  custom-attributes-api/custom-attribute-definitions#updatable-definition-fields).
#  To enable [optimistic
#  loper.squareup.com/docs/build-basics/common-api-patterns/optimistic-concurrency)
#  control, include the optional `version` field and specify the current version of
#  the custom attribute definition.Request of type SquareApiClient::CustomAttributeDefinition, as a Hash
      #   * :key (String) 
      #   * :schema (Hash{String => Object}) 
      #   * :name (String) 
      #   * :description (String) 
      #   * :visibility (SquareApiClient::CustomAttributeDefinitionVisibility) 
      #   * :version (Integer) 
      #   * :updated_at (String) 
      #   * :created_at (String) 
      # @param idempotency_key [String] A unique identifier for this request, used to ensure idempotency.
#  For more information, see
#  tps://developer.squareup.com/docs/build-basics/common-api-patterns/idempotency).
      # @param request_options [SquareApiClient::RequestOptions] 
      # @return [SquareApiClient::UpdateOrderCustomAttributeDefinitionResponse]
      # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.orders.custom_attribute_definitions.update(
#    key: "key",
#    custom_attribute_definition: { key: "cover-count", visibility: VISIBILITY_READ_ONLY, version: 1 },
#    idempotency_key: "IDEMPOTENCY_KEY"
#  )
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
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/orders/custom-attribute-definitions/#{key}"
end
          SquareApiClient::UpdateOrderCustomAttributeDefinitionResponse.from_json(json_object: response.body)
        end
      end
# Deletes an order-related [custom attribute
#  definition](entity:CustomAttributeDefinition) from a Square seller account.
#  Only the definition owner can delete a custom attribute definition.
      #
      # @param key [String] The key of the custom attribute definition to delete.
      # @param request_options [SquareApiClient::RequestOptions] 
      # @return [SquareApiClient::DeleteOrderCustomAttributeDefinitionResponse]
      # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.orders.custom_attribute_definitions.delete(key: "key")
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
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/orders/custom-attribute-definitions/#{key}"
end
          SquareApiClient::DeleteOrderCustomAttributeDefinitionResponse.from_json(json_object: response.body)
        end
      end
    end
  end
end