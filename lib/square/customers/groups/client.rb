# frozen_string_literal: true

module Square
  module Customers
    module Groups
      class Client
        # @return [Square::Customers::Groups::Client]
        def initialize(client:)
          @client = client
        end

        # Retrieves the list of customer groups of a business.
        #
        # @return [Square::Types::ListCustomerGroupsResponse]
        def list(request_options: {}, **params)
          _query_param_names = [
            %w[cursor limit],
            %i[cursor limit]
          ].flatten
          _query = params.slice(*_query_param_names)
          params.except(*_query_param_names)

          _request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Square::Environment::SANDBOX,
            method: "GET",
            path: "v2/customers/groups",
            query: _query
          )
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Square::Types::ListCustomerGroupsResponse.load(_response.body)
          end

          raise _response.body
        end

        # Creates a new customer group for a business.
        #
        # The request must include the `name` value of the group.
        #
        # @return [Square::Types::CreateCustomerGroupResponse]
        def create(request_options: {}, **params)
          _request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Square::Environment::SANDBOX,
            method: "POST",
            path: "v2/customers/groups",
            body: params
          )
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Square::Types::CreateCustomerGroupResponse.load(_response.body)
          end

          raise _response.body
        end

        # Retrieves a specific customer group as identified by the `group_id` value.
        #
        # @return [Square::Types::GetCustomerGroupResponse]
        def get(request_options: {}, **params)
          _request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Square::Environment::SANDBOX,
            method: "GET",
            path: "v2/customers/groups/#{params[:group_id]}"
          )
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Square::Types::GetCustomerGroupResponse.load(_response.body)
          end

          raise _response.body
        end

        # Updates a customer group as identified by the `group_id` value.
        #
        # @return [Square::Types::UpdateCustomerGroupResponse]
        def update(request_options: {}, **params)
          _path_param_names = ["group_id"]

          _request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Square::Environment::SANDBOX,
            method: "PUT",
            path: "v2/customers/groups/#{params[:group_id]}",
            body: params.except(*_path_param_names)
          )
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Square::Types::UpdateCustomerGroupResponse.load(_response.body)
          end

          raise _response.body
        end

        # Deletes a customer group as identified by the `group_id` value.
        #
        # @return [Square::Types::DeleteCustomerGroupResponse]
        def delete(request_options: {}, **params)
          _request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Square::Environment::SANDBOX,
            method: "DELETE",
            path: "v2/customers/groups/#{params[:group_id]}"
          )
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Square::Types::DeleteCustomerGroupResponse.load(_response.body)
          end

          raise _response.body
        end

        # Adds a group membership to a customer.
        #
        # The customer is identified by the `customer_id` value
        # and the customer group is identified by the `group_id` value.
        #
        # @return [Square::Types::AddGroupToCustomerResponse]
        def add(request_options: {}, **params)
          _request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Square::Environment::SANDBOX,
            method: "PUT",
            path: "v2/customers/#{params[:customer_id]}/groups/#{params[:group_id]}"
          )
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Square::Types::AddGroupToCustomerResponse.load(_response.body)
          end

          raise _response.body
        end

        # Removes a group membership from a customer.
        #
        # The customer is identified by the `customer_id` value
        # and the customer group is identified by the `group_id` value.
        #
        # @return [Square::Types::RemoveGroupFromCustomerResponse]
        def remove(request_options: {}, **params)
          _request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Square::Environment::SANDBOX,
            method: "DELETE",
            path: "v2/customers/#{params[:customer_id]}/groups/#{params[:group_id]}"
          )
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Square::Types::RemoveGroupFromCustomerResponse.load(_response.body)
          end

          raise _response.body
        end
      end
    end
  end
end
