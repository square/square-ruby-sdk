
module Square
  module Customers
    module Groups
      class Client
        # @option client [Square::Internal::Http::RawClient]
        #
        # @return [Square::Customers::Groups::Client]
        def initialize(client)
          @client = client
        end

        # Retrieves the list of customer groups of a business.
        #
        # @return [Square::ListCustomerGroupsResponse]
        def list(request_options: {}, **params)
          _request = params

          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Square::Types::ListCustomerGroupsResponse.load(_response.body)

          else
            raise _response.body
        end

        # Creates a new customer group for a business.
        # 
        # The request must include the `name` value of the group.
        #
        # @return [Square::CreateCustomerGroupResponse]
        def create(request_options: {}, **params)
          _request = params

          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Square::Types::CreateCustomerGroupResponse.load(_response.body)

          else
            raise _response.body
        end

        # Retrieves a specific customer group as identified by the `group_id` value.
        #
        # @return [Square::GetCustomerGroupResponse]
        def get(request_options: {}, **params)
          _request = params

          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Square::Types::GetCustomerGroupResponse.load(_response.body)

          else
            raise _response.body
        end

        # Updates a customer group as identified by the `group_id` value.
        #
        # @return [Square::UpdateCustomerGroupResponse]
        def update(request_options: {}, **params)
          _request = params

          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Square::Types::UpdateCustomerGroupResponse.load(_response.body)

          else
            raise _response.body
        end

        # Deletes a customer group as identified by the `group_id` value.
        #
        # @return [Square::DeleteCustomerGroupResponse]
        def delete(request_options: {}, **params)
          _request = params

          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Square::Types::DeleteCustomerGroupResponse.load(_response.body)

          else
            raise _response.body
        end

        # Adds a group membership to a customer.
        # 
        # The customer is identified by the `customer_id` value
        # and the customer group is identified by the `group_id` value.
        #
        # @return [Square::AddGroupToCustomerResponse]
        def add(request_options: {}, **params)
          _request = params

          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Square::Types::AddGroupToCustomerResponse.load(_response.body)

          else
            raise _response.body
        end

        # Removes a group membership from a customer.
        # 
        # The customer is identified by the `customer_id` value
        # and the customer group is identified by the `group_id` value.
        #
        # @return [Square::RemoveGroupFromCustomerResponse]
        def remove(request_options: {}, **params)
          _request = params

          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Square::Types::RemoveGroupFromCustomerResponse.load(_response.body)

          else
            raise _response.body
        end

      end
    end
  end
end
