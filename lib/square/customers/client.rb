
module Square
  module Customers
    class Client
      # @return [Square::Customers::Client]
      def initialize(client:)
        @client = client
      end

      # Lists customer profiles associated with a Square account.
      # 
      # Under normal operating conditions, newly created or updated customer profiles become available
      # for the listing operation in well under 30 seconds. Occasionally, propagation of the new or updated
      # profiles can take closer to one minute or longer, especially during network incidents and outages.
      #
      # @return [Square::Types::ListCustomersResponse]
      def list(request_options: {}, **params)
        _request = params
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::ListCustomersResponse.load(_response.body)
        else
          raise _response.body
        end
      end

      # Creates a new customer for a business.
      # 
      # You must provide at least one of the following values in your request to this
      # endpoint:
      # 
      # - `given_name`
      # - `family_name`
      # - `company_name`
      # - `email_address`
      # - `phone_number`
      #
      # @return [Square::Types::CreateCustomerResponse]
      def create(request_options: {}, **params)
        _request = params
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::CreateCustomerResponse.load(_response.body)
        else
          raise _response.body
        end
      end

      # Creates multiple [customer profiles](entity:Customer) for a business.
      # 
      # This endpoint takes a map of individual create requests and returns a map of responses.
      # 
      # You must provide at least one of the following values in each create request:
      # 
      # - `given_name`
      # - `family_name`
      # - `company_name`
      # - `email_address`
      # - `phone_number`
      #
      # @return [Square::Types::BulkCreateCustomersResponse]
      def batch_create(request_options: {}, **params)
        _request = params
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::BulkCreateCustomersResponse.load(_response.body)
        else
          raise _response.body
        end
      end

      # Deletes multiple customer profiles.
      # 
      # The endpoint takes a list of customer IDs and returns a map of responses.
      #
      # @return [Square::Types::BulkDeleteCustomersResponse]
      def bulk_delete_customers(request_options: {}, **params)
        _request = params
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::BulkDeleteCustomersResponse.load(_response.body)
        else
          raise _response.body
        end
      end

      # Retrieves multiple customer profiles.
      # 
      # This endpoint takes a list of customer IDs and returns a map of responses.
      #
      # @return [Square::Types::BulkRetrieveCustomersResponse]
      def bulk_retrieve_customers(request_options: {}, **params)
        _request = params
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::BulkRetrieveCustomersResponse.load(_response.body)
        else
          raise _response.body
        end
      end

      # Updates multiple customer profiles.
      # 
      # This endpoint takes a map of individual update requests and returns a map of responses.
      #
      # @return [Square::Types::BulkUpdateCustomersResponse]
      def bulk_update_customers(request_options: {}, **params)
        _request = params
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::BulkUpdateCustomersResponse.load(_response.body)
        else
          raise _response.body
        end
      end

      # Searches the customer profiles associated with a Square account using one or more supported query filters.
      # 
      # Calling `SearchCustomers` without any explicit query filter returns all
      # customer profiles ordered alphabetically based on `given_name` and
      # `family_name`.
      # 
      # Under normal operating conditions, newly created or updated customer profiles become available
      # for the search operation in well under 30 seconds. Occasionally, propagation of the new or updated
      # profiles can take closer to one minute or longer, especially during network incidents and outages.
      #
      # @return [Square::Types::SearchCustomersResponse]
      def search(request_options: {}, **params)
        _request = params
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::SearchCustomersResponse.load(_response.body)
        else
          raise _response.body
        end
      end

      # Returns details for a single customer.
      #
      # @return [Square::Types::GetCustomerResponse]
      def get(request_options: {}, **params)
        _request = params
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::GetCustomerResponse.load(_response.body)
        else
          raise _response.body
        end
      end

      # Updates a customer profile. This endpoint supports sparse updates, so only new or changed fields are required in the request.
      # To add or update a field, specify the new value. To remove a field, specify `null`.
      # 
      # To update a customer profile that was created by merging existing profiles, you must use the ID of the newly created profile.
      #
      # @return [Square::Types::UpdateCustomerResponse]
      def update(request_options: {}, **params)
        _request = params
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::UpdateCustomerResponse.load(_response.body)
        else
          raise _response.body
        end
      end

      # Deletes a customer profile from a business.
      # 
      # To delete a customer profile that was created by merging existing profiles, you must use the ID of the newly created profile.
      #
      # @return [Square::Types::DeleteCustomerResponse]
      def delete(request_options: {}, **params)
        _request = params
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::DeleteCustomerResponse.load(_response.body)
        else
          raise _response.body
        end
      end

    end
  end
end
