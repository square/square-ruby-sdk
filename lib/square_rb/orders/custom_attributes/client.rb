# frozen_string_literal: true
require_relative "../../../requests"
require_relative "../../types/bulk_delete_order_custom_attributes_response"
require_relative "../../types/bulk_upsert_order_custom_attributes_response"
require_relative "../../types/visibility_filter"
require_relative "../../types/list_order_custom_attributes_response"
require_relative "../../types/retrieve_order_custom_attribute_response"
require_relative "../../types/custom_attribute"
require_relative "../../types/upsert_order_custom_attribute_response"
require_relative "../../types/delete_order_custom_attribute_response"
require "async"
require "async"
require "async"
require "async"
require "async"
require "async"
require_relative "../../../requests"

module SquareApiClient
  module Orders
    class CustomAttributesClient
    # @return [SquareApiClient::RequestClient] 
      attr_reader :request_client


      # @param request_client [SquareApiClient::RequestClient] 
      # @return [SquareApiClient::Orders::CustomAttributesClient]
      def initialize(request_client:)
        @request_client = request_client
      end
# Deletes order [custom attributes](entity:CustomAttribute) as a bulk operation.
#  Use this endpoint to delete one or more custom attributes from one or more
#  orders.
#  A custom attribute is based on a custom attribute definition in a Square seller
#  account.  (To create a
#  custom attribute definition, use the
#  nition](api-endpoint:OrderCustomAttributes-CreateOrderCustomAttributeDefinition)
#  endpoint.)
#  This `BulkDeleteOrderCustomAttributes` endpoint accepts a map of 1 to 25
#  individual delete
#  requests and returns a map of individual delete responses. Each delete request
#  has a unique ID
#  and provides an order ID and custom attribute. Each delete response is returned
#  with the ID
#  of the corresponding request.
#  To delete a custom attribute owned by another application, the `visibility`
#  setting
#  must be `VISIBILITY_READ_WRITE_VALUES`. Note that seller-defined custom
#  attributes
#  (also known as custom fields) are always set to `VISIBILITY_READ_WRITE_VALUES`.
      #
      # @param values [Hash{String => SquareApiClient::BulkDeleteOrderCustomAttributesRequestDeleteCustomAttribute}] A map of requests that correspond to individual delete operations for custom
#  attributes.
      # @param request_options [SquareApiClient::RequestOptions] 
      # @return [SquareApiClient::BulkDeleteOrderCustomAttributesResponse]
      # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.orders.custom_attributes.batch_delete(values: { "cover-count": { key: "cover-count", order_id: "7BbXGEIWNldxAzrtGf9GPVZTwZ4F" }, "table-number": { key: "table-number", order_id: "7BbXGEIWNldxAzrtGf9GPVZTwZ4F" } })
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
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/orders/custom-attributes/bulk-delete"
end
        SquareApiClient::BulkDeleteOrderCustomAttributesResponse.from_json(json_object: response.body)
      end
# Creates or updates order [custom attributes](entity:CustomAttribute) as a bulk
#  operation.
#  Use this endpoint to delete one or more custom attributes from one or more
#  orders.
#  A custom attribute is based on a custom attribute definition in a Square seller
#  account.  (To create a
#  custom attribute definition, use the
#  nition](api-endpoint:OrderCustomAttributes-CreateOrderCustomAttributeDefinition)
#  endpoint.)
#  This `BulkUpsertOrderCustomAttributes` endpoint accepts a map of 1 to 25
#  individual upsert
#  requests and returns a map of individual upsert responses. Each upsert request
#  has a unique ID
#  and provides an order ID and custom attribute. Each upsert response is returned
#  with the ID
#  of the corresponding request.
#  To create or update a custom attribute owned by another application, the
#  `visibility` setting
#  must be `VISIBILITY_READ_WRITE_VALUES`. Note that seller-defined custom
#  attributes
#  (also known as custom fields) are always set to `VISIBILITY_READ_WRITE_VALUES`.
      #
      # @param values [Hash{String => SquareApiClient::BulkUpsertOrderCustomAttributesRequestUpsertCustomAttribute}] A map of requests that correspond to individual upsert operations for custom
#  attributes.
      # @param request_options [SquareApiClient::RequestOptions] 
      # @return [SquareApiClient::BulkUpsertOrderCustomAttributesResponse]
      # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.orders.custom_attributes.batch_upsert(values: { "cover-count": { custom_attribute: { key: "cover-count", value: "6", version: 2 }, order_id: "7BbXGEIWNldxAzrtGf9GPVZTwZ4F" }, "table-number": { custom_attribute: { key: "table-number", value: "11", version: 4 }, order_id: "7BbXGEIWNldxAzrtGf9GPVZTwZ4F" } })
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
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/orders/custom-attributes/bulk-upsert"
end
        SquareApiClient::BulkUpsertOrderCustomAttributesResponse.from_json(json_object: response.body)
      end
# Lists the [custom attributes](entity:CustomAttribute) associated with an order.
#  You can use the `with_definitions` query parameter to also retrieve custom
#  attribute definitions
#  in the same call.
#  When all response pages are retrieved, the results include all custom attributes
#  that are
#  visible to the requesting application, including those that are owned by other
#  applications
#  and set to `VISIBILITY_READ_ONLY` or `VISIBILITY_READ_WRITE_VALUES`.
      #
      # @param order_id [String] The ID of the target [order](entity:Order).
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
      # @param with_definitions [Boolean] Indicates whether to return the [custom attribute
#  definition](entity:CustomAttributeDefinition) in the `definition` field of each
#  custom attribute. Set this parameter to `true` to get the name and description
#  of each custom attribute,
#  information about the data type, or other definition details. The default value
#  is `false`.
      # @param request_options [SquareApiClient::RequestOptions] 
      # @return [SquareApiClient::ListOrderCustomAttributesResponse]
      # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.orders.custom_attributes.list(order_id: "order_id")
      def list(order_id:, visibility_filter: nil, cursor: nil, limit: nil, with_definitions: nil, request_options: nil)
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
  req.params = { **(request_options&.additional_query_parameters || {}), "visibility_filter": visibility_filter, "cursor": cursor, "limit": limit, "with_definitions": with_definitions }.compact
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/orders/#{order_id}/custom-attributes"
end
        SquareApiClient::ListOrderCustomAttributesResponse.from_json(json_object: response.body)
      end
# Retrieves a [custom attribute](entity:CustomAttribute) associated with an order.
#  You can use the `with_definition` query parameter to also retrieve the custom
#  attribute definition
#  in the same call.
#  To retrieve a custom attribute owned by another application, the `visibility`
#  setting must be
#  `VISIBILITY_READ_ONLY` or `VISIBILITY_READ_WRITE_VALUES`. Note that
#  seller-defined custom attributes
#  also known as custom fields) are always set to `VISIBILITY_READ_WRITE_VALUES`.
      #
      # @param order_id [String] The ID of the target [order](entity:Order).
      # @param custom_attribute_key [String] The key of the custom attribute to retrieve.  This key must match the key of an
#  existing custom attribute definition.
      # @param version [Integer] To enable [optimistic
#  loper.squareup.com/docs/build-basics/common-api-patterns/optimistic-concurrency)
#  control, include this optional field and specify the current version of the
#  custom attribute.
      # @param with_definition [Boolean] Indicates whether to return the [custom attribute
#  definition](entity:CustomAttributeDefinition) in the `definition` field of each
#  custom attribute. Set this parameter to `true` to get the name and description
#  of each custom attribute,
#  information about the data type, or other definition details. The default value
#  is `false`.
      # @param request_options [SquareApiClient::RequestOptions] 
      # @return [SquareApiClient::RetrieveOrderCustomAttributeResponse]
      # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.orders.custom_attributes.get(order_id: "order_id", custom_attribute_key: "custom_attribute_key")
      def get(order_id:, custom_attribute_key:, version: nil, with_definition: nil, request_options: nil)
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
  req.params = { **(request_options&.additional_query_parameters || {}), "version": version, "with_definition": with_definition }.compact
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/orders/#{order_id}/custom-attributes/#{custom_attribute_key}"
end
        SquareApiClient::RetrieveOrderCustomAttributeResponse.from_json(json_object: response.body)
      end
# Creates or updates a [custom attribute](entity:CustomAttribute) for an order.
#  Use this endpoint to set the value of a custom attribute for a specific order.
#  A custom attribute is based on a custom attribute definition in a Square seller
#  account. (To create a
#  custom attribute definition, use the
#  nition](api-endpoint:OrderCustomAttributes-CreateOrderCustomAttributeDefinition)
#  endpoint.)
#  To create or update a custom attribute owned by another application, the
#  `visibility` setting
#  must be `VISIBILITY_READ_WRITE_VALUES`. Note that seller-defined custom
#  attributes
#  (also known as custom fields) are always set to `VISIBILITY_READ_WRITE_VALUES`.
      #
      # @param order_id [String] The ID of the target [order](entity:Order).
      # @param custom_attribute_key [String] The key of the custom attribute to create or update.  This key must match the
#  key
#  of an existing custom attribute definition.
      # @param custom_attribute [Hash] The custom attribute to create or update, with the following fields:
#  - `value`. This value must conform to the `schema` specified by the definition.
#  For more information, see [Value data
#  eup.com/docs/customer-custom-attributes-api/custom-attributes#value-data-types).
#  - `version`. To enable [optimistic
#  loper.squareup.com/docs/build-basics/common-api-patterns/optimistic-concurrency)
#  control, include this optional field and specify the current version of the
#  custom attribute.Request of type SquareApiClient::CustomAttribute, as a Hash
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
      # @param idempotency_key [String] A unique identifier for this request, used to ensure idempotency.
#  For more information, see
#  tps://developer.squareup.com/docs/build-basics/common-api-patterns/idempotency).
      # @param request_options [SquareApiClient::RequestOptions] 
      # @return [SquareApiClient::UpsertOrderCustomAttributeResponse]
      # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.orders.custom_attributes.upsert(
#    order_id: "order_id",
#    custom_attribute_key: "custom_attribute_key",
#    custom_attribute: { key: "table-number", value: "42", version: 1 }
#  )
      def upsert(order_id:, custom_attribute_key:, custom_attribute:, idempotency_key: nil, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/orders/#{order_id}/custom-attributes/#{custom_attribute_key}"
end
        SquareApiClient::UpsertOrderCustomAttributeResponse.from_json(json_object: response.body)
      end
# Deletes a [custom attribute](entity:CustomAttribute) associated with a customer
#  profile.
#  To delete a custom attribute owned by another application, the `visibility`
#  setting must be
#  `VISIBILITY_READ_WRITE_VALUES`. Note that seller-defined custom attributes
#  (also known as custom fields) are always set to `VISIBILITY_READ_WRITE_VALUES`.
      #
      # @param order_id [String] The ID of the target [order](entity:Order).
      # @param custom_attribute_key [String] The key of the custom attribute to delete.  This key must match the key of an
#  existing custom attribute definition.
      # @param request_options [SquareApiClient::RequestOptions] 
      # @return [SquareApiClient::DeleteOrderCustomAttributeResponse]
      # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.orders.custom_attributes.delete(order_id: "order_id", custom_attribute_key: "custom_attribute_key")
      def delete(order_id:, custom_attribute_key:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/orders/#{order_id}/custom-attributes/#{custom_attribute_key}"
end
        SquareApiClient::DeleteOrderCustomAttributeResponse.from_json(json_object: response.body)
      end
    end
    class AsyncCustomAttributesClient
    # @return [SquareApiClient::AsyncRequestClient] 
      attr_reader :request_client


      # @param request_client [SquareApiClient::RequestClient] 
      # @return [SquareApiClient::Orders::AsyncCustomAttributesClient]
      def initialize(request_client:)
        @request_client = request_client
      end
# Deletes order [custom attributes](entity:CustomAttribute) as a bulk operation.
#  Use this endpoint to delete one or more custom attributes from one or more
#  orders.
#  A custom attribute is based on a custom attribute definition in a Square seller
#  account.  (To create a
#  custom attribute definition, use the
#  nition](api-endpoint:OrderCustomAttributes-CreateOrderCustomAttributeDefinition)
#  endpoint.)
#  This `BulkDeleteOrderCustomAttributes` endpoint accepts a map of 1 to 25
#  individual delete
#  requests and returns a map of individual delete responses. Each delete request
#  has a unique ID
#  and provides an order ID and custom attribute. Each delete response is returned
#  with the ID
#  of the corresponding request.
#  To delete a custom attribute owned by another application, the `visibility`
#  setting
#  must be `VISIBILITY_READ_WRITE_VALUES`. Note that seller-defined custom
#  attributes
#  (also known as custom fields) are always set to `VISIBILITY_READ_WRITE_VALUES`.
      #
      # @param values [Hash{String => SquareApiClient::BulkDeleteOrderCustomAttributesRequestDeleteCustomAttribute}] A map of requests that correspond to individual delete operations for custom
#  attributes.
      # @param request_options [SquareApiClient::RequestOptions] 
      # @return [SquareApiClient::BulkDeleteOrderCustomAttributesResponse]
      # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.orders.custom_attributes.batch_delete(values: { "cover-count": { key: "cover-count", order_id: "7BbXGEIWNldxAzrtGf9GPVZTwZ4F" }, "table-number": { key: "table-number", order_id: "7BbXGEIWNldxAzrtGf9GPVZTwZ4F" } })
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
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/orders/custom-attributes/bulk-delete"
end
          SquareApiClient::BulkDeleteOrderCustomAttributesResponse.from_json(json_object: response.body)
        end
      end
# Creates or updates order [custom attributes](entity:CustomAttribute) as a bulk
#  operation.
#  Use this endpoint to delete one or more custom attributes from one or more
#  orders.
#  A custom attribute is based on a custom attribute definition in a Square seller
#  account.  (To create a
#  custom attribute definition, use the
#  nition](api-endpoint:OrderCustomAttributes-CreateOrderCustomAttributeDefinition)
#  endpoint.)
#  This `BulkUpsertOrderCustomAttributes` endpoint accepts a map of 1 to 25
#  individual upsert
#  requests and returns a map of individual upsert responses. Each upsert request
#  has a unique ID
#  and provides an order ID and custom attribute. Each upsert response is returned
#  with the ID
#  of the corresponding request.
#  To create or update a custom attribute owned by another application, the
#  `visibility` setting
#  must be `VISIBILITY_READ_WRITE_VALUES`. Note that seller-defined custom
#  attributes
#  (also known as custom fields) are always set to `VISIBILITY_READ_WRITE_VALUES`.
      #
      # @param values [Hash{String => SquareApiClient::BulkUpsertOrderCustomAttributesRequestUpsertCustomAttribute}] A map of requests that correspond to individual upsert operations for custom
#  attributes.
      # @param request_options [SquareApiClient::RequestOptions] 
      # @return [SquareApiClient::BulkUpsertOrderCustomAttributesResponse]
      # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.orders.custom_attributes.batch_upsert(values: { "cover-count": { custom_attribute: { key: "cover-count", value: "6", version: 2 }, order_id: "7BbXGEIWNldxAzrtGf9GPVZTwZ4F" }, "table-number": { custom_attribute: { key: "table-number", value: "11", version: 4 }, order_id: "7BbXGEIWNldxAzrtGf9GPVZTwZ4F" } })
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
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/orders/custom-attributes/bulk-upsert"
end
          SquareApiClient::BulkUpsertOrderCustomAttributesResponse.from_json(json_object: response.body)
        end
      end
# Lists the [custom attributes](entity:CustomAttribute) associated with an order.
#  You can use the `with_definitions` query parameter to also retrieve custom
#  attribute definitions
#  in the same call.
#  When all response pages are retrieved, the results include all custom attributes
#  that are
#  visible to the requesting application, including those that are owned by other
#  applications
#  and set to `VISIBILITY_READ_ONLY` or `VISIBILITY_READ_WRITE_VALUES`.
      #
      # @param order_id [String] The ID of the target [order](entity:Order).
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
      # @param with_definitions [Boolean] Indicates whether to return the [custom attribute
#  definition](entity:CustomAttributeDefinition) in the `definition` field of each
#  custom attribute. Set this parameter to `true` to get the name and description
#  of each custom attribute,
#  information about the data type, or other definition details. The default value
#  is `false`.
      # @param request_options [SquareApiClient::RequestOptions] 
      # @return [SquareApiClient::ListOrderCustomAttributesResponse]
      # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.orders.custom_attributes.list(order_id: "order_id")
      def list(order_id:, visibility_filter: nil, cursor: nil, limit: nil, with_definitions: nil, request_options: nil)
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
  req.params = { **(request_options&.additional_query_parameters || {}), "visibility_filter": visibility_filter, "cursor": cursor, "limit": limit, "with_definitions": with_definitions }.compact
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/orders/#{order_id}/custom-attributes"
end
          SquareApiClient::ListOrderCustomAttributesResponse.from_json(json_object: response.body)
        end
      end
# Retrieves a [custom attribute](entity:CustomAttribute) associated with an order.
#  You can use the `with_definition` query parameter to also retrieve the custom
#  attribute definition
#  in the same call.
#  To retrieve a custom attribute owned by another application, the `visibility`
#  setting must be
#  `VISIBILITY_READ_ONLY` or `VISIBILITY_READ_WRITE_VALUES`. Note that
#  seller-defined custom attributes
#  also known as custom fields) are always set to `VISIBILITY_READ_WRITE_VALUES`.
      #
      # @param order_id [String] The ID of the target [order](entity:Order).
      # @param custom_attribute_key [String] The key of the custom attribute to retrieve.  This key must match the key of an
#  existing custom attribute definition.
      # @param version [Integer] To enable [optimistic
#  loper.squareup.com/docs/build-basics/common-api-patterns/optimistic-concurrency)
#  control, include this optional field and specify the current version of the
#  custom attribute.
      # @param with_definition [Boolean] Indicates whether to return the [custom attribute
#  definition](entity:CustomAttributeDefinition) in the `definition` field of each
#  custom attribute. Set this parameter to `true` to get the name and description
#  of each custom attribute,
#  information about the data type, or other definition details. The default value
#  is `false`.
      # @param request_options [SquareApiClient::RequestOptions] 
      # @return [SquareApiClient::RetrieveOrderCustomAttributeResponse]
      # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.orders.custom_attributes.get(order_id: "order_id", custom_attribute_key: "custom_attribute_key")
      def get(order_id:, custom_attribute_key:, version: nil, with_definition: nil, request_options: nil)
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
  req.params = { **(request_options&.additional_query_parameters || {}), "version": version, "with_definition": with_definition }.compact
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/orders/#{order_id}/custom-attributes/#{custom_attribute_key}"
end
          SquareApiClient::RetrieveOrderCustomAttributeResponse.from_json(json_object: response.body)
        end
      end
# Creates or updates a [custom attribute](entity:CustomAttribute) for an order.
#  Use this endpoint to set the value of a custom attribute for a specific order.
#  A custom attribute is based on a custom attribute definition in a Square seller
#  account. (To create a
#  custom attribute definition, use the
#  nition](api-endpoint:OrderCustomAttributes-CreateOrderCustomAttributeDefinition)
#  endpoint.)
#  To create or update a custom attribute owned by another application, the
#  `visibility` setting
#  must be `VISIBILITY_READ_WRITE_VALUES`. Note that seller-defined custom
#  attributes
#  (also known as custom fields) are always set to `VISIBILITY_READ_WRITE_VALUES`.
      #
      # @param order_id [String] The ID of the target [order](entity:Order).
      # @param custom_attribute_key [String] The key of the custom attribute to create or update.  This key must match the
#  key
#  of an existing custom attribute definition.
      # @param custom_attribute [Hash] The custom attribute to create or update, with the following fields:
#  - `value`. This value must conform to the `schema` specified by the definition.
#  For more information, see [Value data
#  eup.com/docs/customer-custom-attributes-api/custom-attributes#value-data-types).
#  - `version`. To enable [optimistic
#  loper.squareup.com/docs/build-basics/common-api-patterns/optimistic-concurrency)
#  control, include this optional field and specify the current version of the
#  custom attribute.Request of type SquareApiClient::CustomAttribute, as a Hash
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
      # @param idempotency_key [String] A unique identifier for this request, used to ensure idempotency.
#  For more information, see
#  tps://developer.squareup.com/docs/build-basics/common-api-patterns/idempotency).
      # @param request_options [SquareApiClient::RequestOptions] 
      # @return [SquareApiClient::UpsertOrderCustomAttributeResponse]
      # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.orders.custom_attributes.upsert(
#    order_id: "order_id",
#    custom_attribute_key: "custom_attribute_key",
#    custom_attribute: { key: "table-number", value: "42", version: 1 }
#  )
      def upsert(order_id:, custom_attribute_key:, custom_attribute:, idempotency_key: nil, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/orders/#{order_id}/custom-attributes/#{custom_attribute_key}"
end
          SquareApiClient::UpsertOrderCustomAttributeResponse.from_json(json_object: response.body)
        end
      end
# Deletes a [custom attribute](entity:CustomAttribute) associated with a customer
#  profile.
#  To delete a custom attribute owned by another application, the `visibility`
#  setting must be
#  `VISIBILITY_READ_WRITE_VALUES`. Note that seller-defined custom attributes
#  (also known as custom fields) are always set to `VISIBILITY_READ_WRITE_VALUES`.
      #
      # @param order_id [String] The ID of the target [order](entity:Order).
      # @param custom_attribute_key [String] The key of the custom attribute to delete.  This key must match the key of an
#  existing custom attribute definition.
      # @param request_options [SquareApiClient::RequestOptions] 
      # @return [SquareApiClient::DeleteOrderCustomAttributeResponse]
      # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.orders.custom_attributes.delete(order_id: "order_id", custom_attribute_key: "custom_attribute_key")
      def delete(order_id:, custom_attribute_key:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/orders/#{order_id}/custom-attributes/#{custom_attribute_key}"
end
          SquareApiClient::DeleteOrderCustomAttributeResponse.from_json(json_object: response.body)
        end
      end
    end
  end
end