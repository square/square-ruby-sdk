
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
        # @return [Square::Types::ListCustomerGroupsResponse]
        def list(request_options: {}, **params)
          _request = params
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Square::Types::ListCustomerGroupsResponse.load(_response.body)
          else
            raise _response.body
          end
        end

        # Creates a new customer group for a business.
        # 
        # The request must include the `name` value of the group.
        #
        # @return [Square::Types::CreateCustomerGroupResponse]
        def create(request_options: {}, **params)
          _request = params
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Square::Types::CreateCustomerGroupResponse.load(_response.body)
          else
            raise _response.body
          end
        end

        # Retrieves a specific customer group as identified by the `group_id` value.
        #
        # @return [Square::Types::GetCustomerGroupResponse]
        def get(request_options: {}, **params)
          _request = params
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Square::Types::GetCustomerGroupResponse.load(_response.body)
          else
            raise _response.body
          end
        end

        # Updates a customer group as identified by the `group_id` value.
        #
        # @return [Square::Types::UpdateCustomerGroupResponse]
        def update(request_options: {}, **params)
          _request = params
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Square::Types::UpdateCustomerGroupResponse.load(_response.body)
          else
            raise _response.body
          end
        end

        # Deletes a customer group as identified by the `group_id` value.
        #
        # @return [Square::Types::DeleteCustomerGroupResponse]
        def delete(request_options: {}, **params)
          _request = params
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Square::Types::DeleteCustomerGroupResponse.load(_response.body)
          else
            raise _response.body
          end
        end

        # Adds a group membership to a customer.
        # 
        # The customer is identified by the `customer_id` value
        # and the customer group is identified by the `group_id` value.
        #
        # @return [Square::Types::AddGroupToCustomerResponse]
        def add(request_options: {}, **params)
          _request = params
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Square::Types::AddGroupToCustomerResponse.load(_response.body)
          else
            raise _response.body
          end
        end

        # Removes a group membership from a customer.
        # 
        # The customer is identified by the `customer_id` value
        # and the customer group is identified by the `group_id` value.
        #
        # @return [Square::Types::RemoveGroupFromCustomerResponse]
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
end
