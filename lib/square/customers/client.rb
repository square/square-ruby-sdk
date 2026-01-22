# frozen_string_literal: true

module Square
  module Customers
    class Client
      # @param client [Square::Internal::Http::RawClient]
      #
      # @return [void]
      def initialize(client:)
        @client = client
      end

      # Lists customer profiles associated with a Square account.
      #
      # Under normal operating conditions, newly created or updated customer profiles become available
      # for the listing operation in well under 30 seconds. Occasionally, propagation of the new or updated
      # profiles can take closer to one minute or longer, especially during network incidents and outages.
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String, nil] :cursor
      # @option params [Integer, nil] :limit
      # @option params [Square::Types::CustomerSortField, nil] :sort_field
      # @option params [Square::Types::SortOrder, nil] :sort_order
      # @option params [Boolean, nil] :count
      #
      # @return [Square::Types::ListCustomersResponse]
      def list(request_options: {}, **params)
        params = Square::Internal::Types::Utils.symbolize_keys(params)
        query_param_names = %i[cursor limit sort_field sort_order count]
        query_params = {}
        query_params["cursor"] = params[:cursor] if params.key?(:cursor)
        query_params["limit"] = params[:limit] if params.key?(:limit)
        query_params["sort_field"] = params[:sort_field] if params.key?(:sort_field)
        query_params["sort_order"] = params[:sort_order] if params.key?(:sort_order)
        query_params["count"] = params[:count] if params.key?(:count)
        params.except(*query_param_names)

        Square::Internal::CursorItemIterator.new(
          cursor_field: :cursor,
          item_field: :customers,
          initial_cursor: query_params[:cursor]
        ) do |next_cursor|
          query_params[:cursor] = next_cursor
          request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "GET",
            path: "v2/customers",
            query: query_params,
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Square::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Square::Types::ListCustomersResponse.load(response.body)
          else
            error_class = Square::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
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
      # @param request_options [Hash]
      # @param params [Square::Customers::Types::CreateCustomerRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @return [Square::Types::CreateCustomerResponse]
      def create(request_options: {}, **params)
        body_prop_names = %i[idempotency_key given_name family_name company_name nickname email_address address phone_number reference_id note birthday tax_ids]
        body_bag = params.slice(*body_prop_names)

        request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "v2/customers",
          body: Square::Customers::Types::CreateCustomerRequest.new(body_bag).to_h,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Square::Types::CreateCustomerResponse.load(response.body)
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
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
      # @param request_options [Hash]
      # @param params [Square::Customers::Types::BulkCreateCustomersRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @return [Square::Types::BulkCreateCustomersResponse]
      def batch_create(request_options: {}, **params)
        body_prop_names = %i[customers]
        body_bag = params.slice(*body_prop_names)

        request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "v2/customers/bulk-create",
          body: Square::Customers::Types::BulkCreateCustomersRequest.new(body_bag).to_h,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Square::Types::BulkCreateCustomersResponse.load(response.body)
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Deletes multiple customer profiles.
      #
      # The endpoint takes a list of customer IDs and returns a map of responses.
      #
      # @param request_options [Hash]
      # @param params [Square::Customers::Types::BulkDeleteCustomersRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @return [Square::Types::BulkDeleteCustomersResponse]
      def bulk_delete_customers(request_options: {}, **params)
        body_prop_names = %i[customer_ids]
        body_bag = params.slice(*body_prop_names)

        request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "v2/customers/bulk-delete",
          body: Square::Customers::Types::BulkDeleteCustomersRequest.new(body_bag).to_h,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Square::Types::BulkDeleteCustomersResponse.load(response.body)
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Retrieves multiple customer profiles.
      #
      # This endpoint takes a list of customer IDs and returns a map of responses.
      #
      # @param request_options [Hash]
      # @param params [Square::Customers::Types::BulkRetrieveCustomersRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @return [Square::Types::BulkRetrieveCustomersResponse]
      def bulk_retrieve_customers(request_options: {}, **params)
        body_prop_names = %i[customer_ids]
        body_bag = params.slice(*body_prop_names)

        request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "v2/customers/bulk-retrieve",
          body: Square::Customers::Types::BulkRetrieveCustomersRequest.new(body_bag).to_h,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Square::Types::BulkRetrieveCustomersResponse.load(response.body)
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Updates multiple customer profiles.
      #
      # This endpoint takes a map of individual update requests and returns a map of responses.
      #
      # @param request_options [Hash]
      # @param params [Square::Customers::Types::BulkUpdateCustomersRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @return [Square::Types::BulkUpdateCustomersResponse]
      def bulk_update_customers(request_options: {}, **params)
        body_prop_names = %i[customers]
        body_bag = params.slice(*body_prop_names)

        request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "v2/customers/bulk-update",
          body: Square::Customers::Types::BulkUpdateCustomersRequest.new(body_bag).to_h,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Square::Types::BulkUpdateCustomersResponse.load(response.body)
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
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
      # @param request_options [Hash]
      # @param params [Square::Customers::Types::SearchCustomersRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @return [Square::Types::SearchCustomersResponse]
      def search(request_options: {}, **params)
        body_prop_names = %i[cursor limit query count]
        body_bag = params.slice(*body_prop_names)

        request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "v2/customers/search",
          body: Square::Customers::Types::SearchCustomersRequest.new(body_bag).to_h,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Square::Types::SearchCustomersResponse.load(response.body)
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Returns details for a single customer.
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :customer_id
      #
      # @return [Square::Types::GetCustomerResponse]
      def get(request_options: {}, **params)
        request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "v2/customers/#{params[:customer_id]}",
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Square::Types::GetCustomerResponse.load(response.body)
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Updates a customer profile. This endpoint supports sparse updates, so only new or changed fields are required in
      # the request.
      # To add or update a field, specify the new value. To remove a field, specify `null`.
      #
      # To update a customer profile that was created by merging existing profiles, you must use the ID of the newly
      # created profile.
      #
      # @param request_options [Hash]
      # @param params [Square::Customers::Types::UpdateCustomerRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :customer_id
      #
      # @return [Square::Types::UpdateCustomerResponse]
      def update(request_options: {}, **params)
        path_param_names = %i[customer_id]
        body_params = params.except(*path_param_names)
        body_prop_names = %i[given_name family_name company_name nickname email_address address phone_number reference_id note birthday version tax_ids]
        body_bag = body_params.slice(*body_prop_names)

        request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "PUT",
          path: "v2/customers/#{params[:customer_id]}",
          body: Square::Customers::Types::UpdateCustomerRequest.new(body_bag).to_h,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Square::Types::UpdateCustomerResponse.load(response.body)
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Deletes a customer profile from a business.
      #
      # To delete a customer profile that was created by merging existing profiles, you must use the ID of the newly
      # created profile.
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :customer_id
      # @option params [Integer, nil] :version
      #
      # @return [Square::Types::DeleteCustomerResponse]
      def delete(request_options: {}, **params)
        params = Square::Internal::Types::Utils.symbolize_keys(params)
        query_param_names = %i[version]
        query_params = {}
        query_params["version"] = params[:version] if params.key?(:version)
        params = params.except(*query_param_names)

        request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "DELETE",
          path: "v2/customers/#{params[:customer_id]}",
          query: query_params,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Square::Types::DeleteCustomerResponse.load(response.body)
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # @return [Square::CustomAttributeDefinitions::Client]
      def custom_attribute_definitions
        @custom_attribute_definitions ||= Square::Customers::CustomAttributeDefinitions::Client.new(client: @client)
      end

      # @return [Square::Groups::Client]
      def groups
        @groups ||= Square::Customers::Groups::Client.new(client: @client)
      end

      # @return [Square::Segments::Client]
      def segments
        @segments ||= Square::Customers::Segments::Client.new(client: @client)
      end

      # @return [Square::Cards::Client]
      def cards
        @cards ||= Square::Customers::Cards::Client.new(client: @client)
      end

      # @return [Square::CustomAttributes::Client]
      def custom_attributes
        @custom_attributes ||= Square::Customers::CustomAttributes::Client.new(client: @client)
      end
    end
  end
end
