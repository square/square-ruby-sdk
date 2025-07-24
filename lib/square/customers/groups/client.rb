# frozen_string_literal: true
require_relative "../../../requests"
require_relative "../../types/list_customer_groups_response"
require_relative "../../types/customer_group"
require_relative "../../types/create_customer_group_response"
require_relative "../../types/get_customer_group_response"
require_relative "../../types/update_customer_group_response"
require_relative "../../types/delete_customer_group_response"
require_relative "../../types/add_group_to_customer_response"
require_relative "../../types/remove_group_from_customer_response"
require "async"
require "async"
require "async"
require "async"
require "async"
require "async"
require "async"
require_relative "../../../requests"

module square.rb
  module Customers
    class GroupsClient
    # @return [square.rb::RequestClient] 
      attr_reader :request_client


      # @param request_client [square.rb::RequestClient] 
      # @return [square.rb::Customers::GroupsClient]
      def initialize(request_client:)
        @request_client = request_client
      end
# Retrieves the list of customer groups of a business.
      #
      # @param cursor [String] A pagination cursor returned by a previous call to this endpoint.
#  Provide this cursor to retrieve the next set of results for your original query.
#  For more information, see
#  ttps://developer.squareup.com/docs/build-basics/common-api-patterns/pagination).
      # @param limit [Integer] The maximum number of results to return in a single page. This limit is
#  advisory. The response might contain more or fewer results.
#  If the limit is less than 1 or greater than 50, Square returns a `400
#  VALUE_TOO_LOW` or `400 VALUE_TOO_HIGH` error. The default value is 50.
#  For more information, see
#  ttps://developer.squareup.com/docs/build-basics/common-api-patterns/pagination).
      # @param request_options [square.rb::RequestOptions] 
      # @return [square.rb::ListCustomerGroupsResponse]
      # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.customers.groups.list
      def list(cursor: nil, limit: nil, request_options: nil)
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
  req.params = { **(request_options&.additional_query_parameters || {}), "cursor": cursor, "limit": limit }.compact
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/customers/groups"
end
        square.rb::ListCustomerGroupsResponse.from_json(json_object: response.body)
      end
# Creates a new customer group for a business.
#  The request must include the `name` value of the group.
      #
      # @param idempotency_key [String] The idempotency key for the request. For more information, see
#  tps://developer.squareup.com/docs/build-basics/common-api-patterns/idempotency).
      # @param group [Hash] The customer group to create.Request of type square.rb::CustomerGroup, as a Hash
      #   * :id (String) 
      #   * :name (String) 
      #   * :created_at (String) 
      #   * :updated_at (String) 
      # @param request_options [square.rb::RequestOptions] 
      # @return [square.rb::CreateCustomerGroupResponse]
      # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.customers.groups.create(group: { name: "Loyal Customers" })
      def create(idempotency_key: nil, group:, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), idempotency_key: idempotency_key, group: group }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/customers/groups"
end
        square.rb::CreateCustomerGroupResponse.from_json(json_object: response.body)
      end
# Retrieves a specific customer group as identified by the `group_id` value.
      #
      # @param group_id [String] The ID of the customer group to retrieve.
      # @param request_options [square.rb::RequestOptions] 
      # @return [square.rb::GetCustomerGroupResponse]
      # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.customers.groups.get(group_id: "group_id")
      def get(group_id:, request_options: nil)
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
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/customers/groups/#{group_id}"
end
        square.rb::GetCustomerGroupResponse.from_json(json_object: response.body)
      end
# Updates a customer group as identified by the `group_id` value.
      #
      # @param group_id [String] The ID of the customer group to update.
      # @param group [Hash] The `CustomerGroup` object including all the updates you want to make.Request of type square.rb::CustomerGroup, as a Hash
      #   * :id (String) 
      #   * :name (String) 
      #   * :created_at (String) 
      #   * :updated_at (String) 
      # @param request_options [square.rb::RequestOptions] 
      # @return [square.rb::UpdateCustomerGroupResponse]
      # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.customers.groups.update(group_id: "group_id", group: { name: "Loyal Customers" })
      def update(group_id:, group:, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), group: group }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/customers/groups/#{group_id}"
end
        square.rb::UpdateCustomerGroupResponse.from_json(json_object: response.body)
      end
# Deletes a customer group as identified by the `group_id` value.
      #
      # @param group_id [String] The ID of the customer group to delete.
      # @param request_options [square.rb::RequestOptions] 
      # @return [square.rb::DeleteCustomerGroupResponse]
      # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.customers.groups.delete(group_id: "group_id")
      def delete(group_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/customers/groups/#{group_id}"
end
        square.rb::DeleteCustomerGroupResponse.from_json(json_object: response.body)
      end
# Adds a group membership to a customer.
#  The customer is identified by the `customer_id` value
#  and the customer group is identified by the `group_id` value.
      #
      # @param customer_id [String] The ID of the customer to add to a group.
      # @param group_id [String] The ID of the customer group to add the customer to.
      # @param request_options [square.rb::RequestOptions] 
      # @return [square.rb::AddGroupToCustomerResponse]
      # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.customers.groups.add(customer_id: "customer_id", group_id: "group_id")
      def add(customer_id:, group_id:, request_options: nil)
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
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/customers/#{customer_id}/groups/#{group_id}"
end
        square.rb::AddGroupToCustomerResponse.from_json(json_object: response.body)
      end
# Removes a group membership from a customer.
#  The customer is identified by the `customer_id` value
#  and the customer group is identified by the `group_id` value.
      #
      # @param customer_id [String] The ID of the customer to remove from the group.
      # @param group_id [String] The ID of the customer group to remove the customer from.
      # @param request_options [square.rb::RequestOptions] 
      # @return [square.rb::RemoveGroupFromCustomerResponse]
      # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.customers.groups.remove(customer_id: "customer_id", group_id: "group_id")
      def remove(customer_id:, group_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/customers/#{customer_id}/groups/#{group_id}"
end
        square.rb::RemoveGroupFromCustomerResponse.from_json(json_object: response.body)
      end
    end
    class AsyncGroupsClient
    # @return [square.rb::AsyncRequestClient] 
      attr_reader :request_client


      # @param request_client [square.rb::RequestClient] 
      # @return [square.rb::Customers::AsyncGroupsClient]
      def initialize(request_client:)
        @request_client = request_client
      end
# Retrieves the list of customer groups of a business.
      #
      # @param cursor [String] A pagination cursor returned by a previous call to this endpoint.
#  Provide this cursor to retrieve the next set of results for your original query.
#  For more information, see
#  ttps://developer.squareup.com/docs/build-basics/common-api-patterns/pagination).
      # @param limit [Integer] The maximum number of results to return in a single page. This limit is
#  advisory. The response might contain more or fewer results.
#  If the limit is less than 1 or greater than 50, Square returns a `400
#  VALUE_TOO_LOW` or `400 VALUE_TOO_HIGH` error. The default value is 50.
#  For more information, see
#  ttps://developer.squareup.com/docs/build-basics/common-api-patterns/pagination).
      # @param request_options [square.rb::RequestOptions] 
      # @return [square.rb::ListCustomerGroupsResponse]
      # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.customers.groups.list
      def list(cursor: nil, limit: nil, request_options: nil)
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
  req.params = { **(request_options&.additional_query_parameters || {}), "cursor": cursor, "limit": limit }.compact
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/customers/groups"
end
          square.rb::ListCustomerGroupsResponse.from_json(json_object: response.body)
        end
      end
# Creates a new customer group for a business.
#  The request must include the `name` value of the group.
      #
      # @param idempotency_key [String] The idempotency key for the request. For more information, see
#  tps://developer.squareup.com/docs/build-basics/common-api-patterns/idempotency).
      # @param group [Hash] The customer group to create.Request of type square.rb::CustomerGroup, as a Hash
      #   * :id (String) 
      #   * :name (String) 
      #   * :created_at (String) 
      #   * :updated_at (String) 
      # @param request_options [square.rb::RequestOptions] 
      # @return [square.rb::CreateCustomerGroupResponse]
      # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.customers.groups.create(group: { name: "Loyal Customers" })
      def create(idempotency_key: nil, group:, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), idempotency_key: idempotency_key, group: group }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/customers/groups"
end
          square.rb::CreateCustomerGroupResponse.from_json(json_object: response.body)
        end
      end
# Retrieves a specific customer group as identified by the `group_id` value.
      #
      # @param group_id [String] The ID of the customer group to retrieve.
      # @param request_options [square.rb::RequestOptions] 
      # @return [square.rb::GetCustomerGroupResponse]
      # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.customers.groups.get(group_id: "group_id")
      def get(group_id:, request_options: nil)
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
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/customers/groups/#{group_id}"
end
          square.rb::GetCustomerGroupResponse.from_json(json_object: response.body)
        end
      end
# Updates a customer group as identified by the `group_id` value.
      #
      # @param group_id [String] The ID of the customer group to update.
      # @param group [Hash] The `CustomerGroup` object including all the updates you want to make.Request of type square.rb::CustomerGroup, as a Hash
      #   * :id (String) 
      #   * :name (String) 
      #   * :created_at (String) 
      #   * :updated_at (String) 
      # @param request_options [square.rb::RequestOptions] 
      # @return [square.rb::UpdateCustomerGroupResponse]
      # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.customers.groups.update(group_id: "group_id", group: { name: "Loyal Customers" })
      def update(group_id:, group:, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), group: group }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/customers/groups/#{group_id}"
end
          square.rb::UpdateCustomerGroupResponse.from_json(json_object: response.body)
        end
      end
# Deletes a customer group as identified by the `group_id` value.
      #
      # @param group_id [String] The ID of the customer group to delete.
      # @param request_options [square.rb::RequestOptions] 
      # @return [square.rb::DeleteCustomerGroupResponse]
      # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.customers.groups.delete(group_id: "group_id")
      def delete(group_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/customers/groups/#{group_id}"
end
          square.rb::DeleteCustomerGroupResponse.from_json(json_object: response.body)
        end
      end
# Adds a group membership to a customer.
#  The customer is identified by the `customer_id` value
#  and the customer group is identified by the `group_id` value.
      #
      # @param customer_id [String] The ID of the customer to add to a group.
      # @param group_id [String] The ID of the customer group to add the customer to.
      # @param request_options [square.rb::RequestOptions] 
      # @return [square.rb::AddGroupToCustomerResponse]
      # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.customers.groups.add(customer_id: "customer_id", group_id: "group_id")
      def add(customer_id:, group_id:, request_options: nil)
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
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/customers/#{customer_id}/groups/#{group_id}"
end
          square.rb::AddGroupToCustomerResponse.from_json(json_object: response.body)
        end
      end
# Removes a group membership from a customer.
#  The customer is identified by the `customer_id` value
#  and the customer group is identified by the `group_id` value.
      #
      # @param customer_id [String] The ID of the customer to remove from the group.
      # @param group_id [String] The ID of the customer group to remove the customer from.
      # @param request_options [square.rb::RequestOptions] 
      # @return [square.rb::RemoveGroupFromCustomerResponse]
      # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.customers.groups.remove(customer_id: "customer_id", group_id: "group_id")
      def remove(customer_id:, group_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/customers/#{customer_id}/groups/#{group_id}"
end
          square.rb::RemoveGroupFromCustomerResponse.from_json(json_object: response.body)
        end
      end
    end
  end
end