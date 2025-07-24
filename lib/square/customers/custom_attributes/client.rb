# frozen_string_literal: true
require_relative "../../../requests"
require_relative "../../types/list_customer_custom_attributes_response"
require_relative "../../types/get_customer_custom_attribute_response"
require_relative "../../types/custom_attribute"
require_relative "../../types/upsert_customer_custom_attribute_response"
require_relative "../../types/delete_customer_custom_attribute_response"
require "async"
require "async"
require "async"
require "async"
require_relative "../../../requests"

module square.rb
  module Customers
    class CustomAttributesClient
    # @return [square.rb::RequestClient] 
      attr_reader :request_client


      # @param request_client [square.rb::RequestClient] 
      # @return [square.rb::Customers::CustomAttributesClient]
      def initialize(request_client:)
        @request_client = request_client
      end
# Lists the [custom attributes](entity:CustomAttribute) associated with a customer
#  profile.
#  You can use the `with_definitions` query parameter to also retrieve custom
#  attribute definitions
#  in the same call.
#  When all response pages are retrieved, the results include all custom attributes
#  that are
#  visible to the requesting application, including those that are owned by other
#  applications
#  and set to `VISIBILITY_READ_ONLY` or `VISIBILITY_READ_WRITE_VALUES`.
      #
      # @param customer_id [String] The ID of the target [customer profile](entity:Customer).
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
      # @param request_options [square.rb::RequestOptions] 
      # @return [square.rb::ListCustomerCustomAttributesResponse]
      # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.customers.custom_attributes.list(customer_id: "customer_id")
      def list(customer_id:, limit: nil, cursor: nil, with_definitions: nil, request_options: nil)
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
  req.params = { **(request_options&.additional_query_parameters || {}), "limit": limit, "cursor": cursor, "with_definitions": with_definitions }.compact
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/customers/#{customer_id}/custom-attributes"
end
        square.rb::ListCustomerCustomAttributesResponse.from_json(json_object: response.body)
      end
# Retrieves a [custom attribute](entity:CustomAttribute) associated with a
#  customer profile.
#  You can use the `with_definition` query parameter to also retrieve the custom
#  attribute definition
#  in the same call.
#  To retrieve a custom attribute owned by another application, the `visibility`
#  setting must be
#  `VISIBILITY_READ_ONLY` or `VISIBILITY_READ_WRITE_VALUES`. Note that
#  seller-defined custom attributes
#  (also known as custom fields) are always set to `VISIBILITY_READ_WRITE_VALUES`.
      #
      # @param customer_id [String] The ID of the target [customer profile](entity:Customer).
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
      # @param request_options [square.rb::RequestOptions] 
      # @return [square.rb::GetCustomerCustomAttributeResponse]
      # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.customers.custom_attributes.get(customer_id: "customer_id", key: "key")
      def get(customer_id:, key:, with_definition: nil, version: nil, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/customers/#{customer_id}/custom-attributes/#{key}"
end
        square.rb::GetCustomerCustomAttributeResponse.from_json(json_object: response.body)
      end
# Creates or updates a [custom attribute](entity:CustomAttribute) for a customer
#  profile.
#  Use this endpoint to set the value of a custom attribute for a specified
#  customer profile.
#  A custom attribute is based on a custom attribute definition in a Square seller
#  account, which
#  is created using the
#  ](api-endpoint:CustomerCustomAttributes-CreateCustomerCustomAttributeDefinition)
#  endpoint.
#  To create or update a custom attribute owned by another application, the
#  `visibility` setting
#  must be `VISIBILITY_READ_WRITE_VALUES`. Note that seller-defined custom
#  attributes
#  (also known as custom fields) are always set to `VISIBILITY_READ_WRITE_VALUES`.
      #
      # @param customer_id [String] The ID of the target [customer profile](entity:Customer).
      # @param key [String] The key of the custom attribute to create or update. This key must match the
#  `key` of a
#  custom attribute definition in the Square seller account. If the requesting
#  application is not
#  the definition owner, you must use the qualified key.
      # @param custom_attribute [Hash] The custom attribute to create or update, with the following fields:
#  - `value`. This value must conform to the `schema` specified by the definition.
#  For more information, see [Value data
#  eup.com/docs/customer-custom-attributes-api/custom-attributes#value-data-types).
#  - `version`. To enable [optimistic
#  loper.squareup.com/docs/build-basics/common-api-patterns/optimistic-concurrency)
#  control for an update operation, include this optional field and specify the
#  current version
#  of the custom attribute.Request of type square.rb::CustomAttribute, as a Hash
      #   * :key (String) 
      #   * :value (Object) 
      #   * :version (Integer) 
      #   * :visibility (square.rb::CustomAttributeDefinitionVisibility) 
      #   * :definition (Hash)
      #     * :key (String) 
      #     * :schema (Hash{String => Object}) 
      #     * :name (String) 
      #     * :description (String) 
      #     * :visibility (square.rb::CustomAttributeDefinitionVisibility) 
      #     * :version (Integer) 
      #     * :updated_at (String) 
      #     * :created_at (String) 
      #   * :updated_at (String) 
      #   * :created_at (String) 
      # @param idempotency_key [String] A unique identifier for this request, used to ensure idempotency. For more
#  information,
#  see
#  tps://developer.squareup.com/docs/build-basics/common-api-patterns/idempotency).
      # @param request_options [square.rb::RequestOptions] 
      # @return [square.rb::UpsertCustomerCustomAttributeResponse]
      # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.customers.custom_attributes.upsert(
#    customer_id: "customer_id",
#    key: "key",
#    custom_attribute: { value: "Dune" }
#  )
      def upsert(customer_id:, key:, custom_attribute:, idempotency_key: nil, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/customers/#{customer_id}/custom-attributes/#{key}"
end
        square.rb::UpsertCustomerCustomAttributeResponse.from_json(json_object: response.body)
      end
# Deletes a [custom attribute](entity:CustomAttribute) associated with a customer
#  profile.
#  To delete a custom attribute owned by another application, the `visibility`
#  setting must be
#  `VISIBILITY_READ_WRITE_VALUES`. Note that seller-defined custom attributes
#  (also known as custom fields) are always set to `VISIBILITY_READ_WRITE_VALUES`.
      #
      # @param customer_id [String] The ID of the target [customer profile](entity:Customer).
      # @param key [String] The key of the custom attribute to delete. This key must match the `key` of a
#  custom
#  attribute definition in the Square seller account. If the requesting application
#  is not the
#  definition owner, you must use the qualified key.
      # @param request_options [square.rb::RequestOptions] 
      # @return [square.rb::DeleteCustomerCustomAttributeResponse]
      # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.customers.custom_attributes.delete(customer_id: "customer_id", key: "key")
      def delete(customer_id:, key:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/customers/#{customer_id}/custom-attributes/#{key}"
end
        square.rb::DeleteCustomerCustomAttributeResponse.from_json(json_object: response.body)
      end
    end
    class AsyncCustomAttributesClient
    # @return [square.rb::AsyncRequestClient] 
      attr_reader :request_client


      # @param request_client [square.rb::RequestClient] 
      # @return [square.rb::Customers::AsyncCustomAttributesClient]
      def initialize(request_client:)
        @request_client = request_client
      end
# Lists the [custom attributes](entity:CustomAttribute) associated with a customer
#  profile.
#  You can use the `with_definitions` query parameter to also retrieve custom
#  attribute definitions
#  in the same call.
#  When all response pages are retrieved, the results include all custom attributes
#  that are
#  visible to the requesting application, including those that are owned by other
#  applications
#  and set to `VISIBILITY_READ_ONLY` or `VISIBILITY_READ_WRITE_VALUES`.
      #
      # @param customer_id [String] The ID of the target [customer profile](entity:Customer).
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
      # @param request_options [square.rb::RequestOptions] 
      # @return [square.rb::ListCustomerCustomAttributesResponse]
      # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.customers.custom_attributes.list(customer_id: "customer_id")
      def list(customer_id:, limit: nil, cursor: nil, with_definitions: nil, request_options: nil)
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
  req.params = { **(request_options&.additional_query_parameters || {}), "limit": limit, "cursor": cursor, "with_definitions": with_definitions }.compact
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/customers/#{customer_id}/custom-attributes"
end
          square.rb::ListCustomerCustomAttributesResponse.from_json(json_object: response.body)
        end
      end
# Retrieves a [custom attribute](entity:CustomAttribute) associated with a
#  customer profile.
#  You can use the `with_definition` query parameter to also retrieve the custom
#  attribute definition
#  in the same call.
#  To retrieve a custom attribute owned by another application, the `visibility`
#  setting must be
#  `VISIBILITY_READ_ONLY` or `VISIBILITY_READ_WRITE_VALUES`. Note that
#  seller-defined custom attributes
#  (also known as custom fields) are always set to `VISIBILITY_READ_WRITE_VALUES`.
      #
      # @param customer_id [String] The ID of the target [customer profile](entity:Customer).
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
      # @param request_options [square.rb::RequestOptions] 
      # @return [square.rb::GetCustomerCustomAttributeResponse]
      # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.customers.custom_attributes.get(customer_id: "customer_id", key: "key")
      def get(customer_id:, key:, with_definition: nil, version: nil, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/customers/#{customer_id}/custom-attributes/#{key}"
end
          square.rb::GetCustomerCustomAttributeResponse.from_json(json_object: response.body)
        end
      end
# Creates or updates a [custom attribute](entity:CustomAttribute) for a customer
#  profile.
#  Use this endpoint to set the value of a custom attribute for a specified
#  customer profile.
#  A custom attribute is based on a custom attribute definition in a Square seller
#  account, which
#  is created using the
#  ](api-endpoint:CustomerCustomAttributes-CreateCustomerCustomAttributeDefinition)
#  endpoint.
#  To create or update a custom attribute owned by another application, the
#  `visibility` setting
#  must be `VISIBILITY_READ_WRITE_VALUES`. Note that seller-defined custom
#  attributes
#  (also known as custom fields) are always set to `VISIBILITY_READ_WRITE_VALUES`.
      #
      # @param customer_id [String] The ID of the target [customer profile](entity:Customer).
      # @param key [String] The key of the custom attribute to create or update. This key must match the
#  `key` of a
#  custom attribute definition in the Square seller account. If the requesting
#  application is not
#  the definition owner, you must use the qualified key.
      # @param custom_attribute [Hash] The custom attribute to create or update, with the following fields:
#  - `value`. This value must conform to the `schema` specified by the definition.
#  For more information, see [Value data
#  eup.com/docs/customer-custom-attributes-api/custom-attributes#value-data-types).
#  - `version`. To enable [optimistic
#  loper.squareup.com/docs/build-basics/common-api-patterns/optimistic-concurrency)
#  control for an update operation, include this optional field and specify the
#  current version
#  of the custom attribute.Request of type square.rb::CustomAttribute, as a Hash
      #   * :key (String) 
      #   * :value (Object) 
      #   * :version (Integer) 
      #   * :visibility (square.rb::CustomAttributeDefinitionVisibility) 
      #   * :definition (Hash)
      #     * :key (String) 
      #     * :schema (Hash{String => Object}) 
      #     * :name (String) 
      #     * :description (String) 
      #     * :visibility (square.rb::CustomAttributeDefinitionVisibility) 
      #     * :version (Integer) 
      #     * :updated_at (String) 
      #     * :created_at (String) 
      #   * :updated_at (String) 
      #   * :created_at (String) 
      # @param idempotency_key [String] A unique identifier for this request, used to ensure idempotency. For more
#  information,
#  see
#  tps://developer.squareup.com/docs/build-basics/common-api-patterns/idempotency).
      # @param request_options [square.rb::RequestOptions] 
      # @return [square.rb::UpsertCustomerCustomAttributeResponse]
      # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.customers.custom_attributes.upsert(
#    customer_id: "customer_id",
#    key: "key",
#    custom_attribute: { value: "Dune" }
#  )
      def upsert(customer_id:, key:, custom_attribute:, idempotency_key: nil, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/customers/#{customer_id}/custom-attributes/#{key}"
end
          square.rb::UpsertCustomerCustomAttributeResponse.from_json(json_object: response.body)
        end
      end
# Deletes a [custom attribute](entity:CustomAttribute) associated with a customer
#  profile.
#  To delete a custom attribute owned by another application, the `visibility`
#  setting must be
#  `VISIBILITY_READ_WRITE_VALUES`. Note that seller-defined custom attributes
#  (also known as custom fields) are always set to `VISIBILITY_READ_WRITE_VALUES`.
      #
      # @param customer_id [String] The ID of the target [customer profile](entity:Customer).
      # @param key [String] The key of the custom attribute to delete. This key must match the `key` of a
#  custom
#  attribute definition in the Square seller account. If the requesting application
#  is not the
#  definition owner, you must use the qualified key.
      # @param request_options [square.rb::RequestOptions] 
      # @return [square.rb::DeleteCustomerCustomAttributeResponse]
      # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.customers.custom_attributes.delete(customer_id: "customer_id", key: "key")
      def delete(customer_id:, key:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/customers/#{customer_id}/custom-attributes/#{key}"
end
          square.rb::DeleteCustomerCustomAttributeResponse.from_json(json_object: response.body)
        end
      end
    end
  end
end