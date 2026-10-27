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
      # Returns a `Square::Internal::CursorItemIterator` that yields each `Square::Types::Customer` in the `customers`
      # field of every page, requesting pages as they are needed. Call `pages` on it to get each page as a
      # `Square::Types::ListCustomersResponse`, including its other fields.
      #
      # No request is sent by this call. The first page is requested when you start iterating (or call
      # `load_first_page`), so an API error is raised by the loop (or by `load_first_page`), not by this call.
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
      # @example
      #   client.customers.list(
      #     cursor: "cursor",
      #     limit: 1,
      #     sort_field: "DEFAULT",
      #     sort_order: "DESC",
      #     count: true
      #   )
      #
      # @return [Square::Internal::CursorItemIterator]
      def list(request_options: {}, **params)
        params = Square::Internal::Types::Utils.normalize_keys(params)
        query_params = {}
        query_params["cursor"] = params[:cursor] if params.key?(:cursor)
        query_params["limit"] = params[:limit] if params.key?(:limit)
        query_params["sort_field"] = params[:sort_field] if params.key?(:sort_field)
        query_params["sort_order"] = params[:sort_order] if params.key?(:sort_order)
        query_params["count"] = params[:count] if params.key?(:count)

        Square::Internal::CursorItemIterator.new(
          cursor_field: :cursor,
          item_field: :customers,
          initial_cursor: query_params["cursor"]
        ) do |next_cursor|
          query_params["cursor"] = next_cursor
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
            parsed_response = (response.body.to_s.empty? ? nil : Square::Types::ListCustomersResponse.load(response.body))
            [parsed_response, response]
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
      # @example
      #   client.customers.create(
      #     given_name: "Amelia",
      #     family_name: "Earhart",
      #     email_address: "Amelia.Earhart@example.com",
      #     address: {
      #       address_line_1: "500 Electric Ave",
      #       address_line_2: "Suite 600",
      #       locality: "New York",
      #       administrative_district_level_1: "NY",
      #       postal_code: "10003",
      #       country: "US"
      #     },
      #     phone_number: "+1-212-555-4240",
      #     reference_id: "YOUR_REFERENCE_ID",
      #     note: "a customer"
      #   )
      #
      # @return [Square::Types::CreateCustomerResponse]
      def create(request_options: {}, **params)
        params = Square::Internal::Types::Utils.normalize_keys(params)
        request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "v2/customers",
          body: Square::Customers::Types::CreateCustomerRequest.new(params).to_h,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          (response.body.to_s.empty? ? nil : Square::Types::CreateCustomerResponse.load(response.body))
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
      # @example
      #   client.customers.batch_create(customers: {
      #     "8bb76c4f-e35d-4c5b-90de-1194cd9179f0" => {
      #       given_name: "Amelia",
      #       family_name: "Earhart",
      #       email_address: "Amelia.Earhart@example.com",
      #       address: {
      #         address_line_1: "500 Electric Ave",
      #         address_line_2: "Suite 600",
      #         locality: "New York",
      #         administrative_district_level_1: "NY",
      #         postal_code: "10003",
      #         country: "US"
      #       },
      #       phone_number: "+1-212-555-4240",
      #       reference_id: "YOUR_REFERENCE_ID",
      #       note: "a customer"
      #     },
      #     "d1689f23-b25d-4932-b2f0-aed00f5e2029" => {
      #       given_name: "Marie",
      #       family_name: "Curie",
      #       email_address: "Marie.Curie@example.com",
      #       address: {
      #         address_line_1: "500 Electric Ave",
      #         address_line_2: "Suite 601",
      #         locality: "New York",
      #         administrative_district_level_1: "NY",
      #         postal_code: "10003",
      #         country: "US"
      #       },
      #       phone_number: "+1-212-444-4240",
      #       reference_id: "YOUR_REFERENCE_ID",
      #       note: "another customer"
      #     }
      #   })
      #
      # @return [Square::Types::BulkCreateCustomersResponse]
      def batch_create(request_options: {}, **params)
        params = Square::Internal::Types::Utils.normalize_keys(params)
        request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "v2/customers/bulk-create",
          body: Square::Customers::Types::BulkCreateCustomersRequest.new(params).to_h,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          (response.body.to_s.empty? ? nil : Square::Types::BulkCreateCustomersResponse.load(response.body))
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
      # @example
      #   client.customers.bulk_delete_customers(customer_ids: %w[8DDA5NZVBZFGAX0V3HPF81HHE0 N18CPRVXR5214XPBBA6BZQWF3C 2GYD7WNXF7BJZW1PMGNXZ3Y8M8])
      #
      # @return [Square::Types::BulkDeleteCustomersResponse]
      def bulk_delete_customers(request_options: {}, **params)
        params = Square::Internal::Types::Utils.normalize_keys(params)
        request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "v2/customers/bulk-delete",
          body: Square::Customers::Types::BulkDeleteCustomersRequest.new(params).to_h,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          (response.body.to_s.empty? ? nil : Square::Types::BulkDeleteCustomersResponse.load(response.body))
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
      # @example
      #   client.customers.bulk_retrieve_customers(customer_ids: %w[8DDA5NZVBZFGAX0V3HPF81HHE0 N18CPRVXR5214XPBBA6BZQWF3C 2GYD7WNXF7BJZW1PMGNXZ3Y8M8])
      #
      # @return [Square::Types::BulkRetrieveCustomersResponse]
      def bulk_retrieve_customers(request_options: {}, **params)
        params = Square::Internal::Types::Utils.normalize_keys(params)
        request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "v2/customers/bulk-retrieve",
          body: Square::Customers::Types::BulkRetrieveCustomersRequest.new(params).to_h,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          (response.body.to_s.empty? ? nil : Square::Types::BulkRetrieveCustomersResponse.load(response.body))
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
      # @example
      #   client.customers.bulk_update_customers(customers: {
      #     "8DDA5NZVBZFGAX0V3HPF81HHE0" => {
      #       email_address: "New.Amelia.Earhart@example.com",
      #       note: "updated customer note",
      #       version: 2
      #     },
      #     N18CPRVXR5214XPBBA6BZQWF3C: {
      #       given_name: "Marie",
      #       family_name: "Curie",
      #       version: 0
      #     }
      #   })
      #
      # @return [Square::Types::BulkUpdateCustomersResponse]
      def bulk_update_customers(request_options: {}, **params)
        params = Square::Internal::Types::Utils.normalize_keys(params)
        request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "v2/customers/bulk-update",
          body: Square::Customers::Types::BulkUpdateCustomersRequest.new(params).to_h,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          (response.body.to_s.empty? ? nil : Square::Types::BulkUpdateCustomersResponse.load(response.body))
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
      # @example
      #   client.customers.search(
      #     limit: 2,
      #     query: {
      #       filter: {
      #         creation_source: {
      #           values: ["THIRD_PARTY"],
      #           rule: "INCLUDE"
      #         },
      #         created_at: {
      #           start_at: "2018-01-01T00:00:00-00:00",
      #           end_at: "2018-02-01T00:00:00-00:00"
      #         },
      #         email_address: {
      #           fuzzy: "example.com"
      #         },
      #         group_ids: {
      #           all: ["545AXB44B4XXWMVQ4W8SBT3HHF"]
      #         }
      #       },
      #       sort: {
      #         field: "CREATED_AT",
      #         order: "ASC"
      #       }
      #     }
      #   )
      #
      # @return [Square::Types::SearchCustomersResponse]
      def search(request_options: {}, **params)
        params = Square::Internal::Types::Utils.normalize_keys(params)
        request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "v2/customers/search",
          body: Square::Customers::Types::SearchCustomersRequest.new(params).to_h,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          (response.body.to_s.empty? ? nil : Square::Types::SearchCustomersResponse.load(response.body))
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
      # @example
      #   client.customers.get(customer_id: "customer_id")
      #
      # @return [Square::Types::GetCustomerResponse]
      def get(request_options: {}, **params)
        params = Square::Internal::Types::Utils.normalize_keys(params)
        request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "v2/customers/#{URI.encode_uri_component(params[:customer_id].to_s)}",
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          (response.body.to_s.empty? ? nil : Square::Types::GetCustomerResponse.load(response.body))
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
      # @example
      #   client.customers.update(
      #     customer_id: "customer_id",
      #     email_address: "New.Amelia.Earhart@example.com",
      #     note: "updated customer note",
      #     version: 2
      #   )
      #
      # @return [Square::Types::UpdateCustomerResponse]
      def update(request_options: {}, **params)
        params = Square::Internal::Types::Utils.normalize_keys(params)
        request_data = Square::Customers::Types::UpdateCustomerRequest.new(params).to_h
        non_body_param_names = %w[customer_id]
        body = request_data.except(*non_body_param_names)

        request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "PUT",
          path: "v2/customers/#{URI.encode_uri_component(params[:customer_id].to_s)}",
          body: body,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          (response.body.to_s.empty? ? nil : Square::Types::UpdateCustomerResponse.load(response.body))
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
      # @example
      #   client.customers.delete(
      #     customer_id: "customer_id",
      #     version: 1000000
      #   )
      #
      # @return [Square::Types::DeleteCustomerResponse]
      def delete(request_options: {}, **params)
        params = Square::Internal::Types::Utils.normalize_keys(params)
        query_params = {}
        query_params["version"] = params[:version] if params.key?(:version)

        request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "DELETE",
          path: "v2/customers/#{URI.encode_uri_component(params[:customer_id].to_s)}",
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
          (response.body.to_s.empty? ? nil : Square::Types::DeleteCustomerResponse.load(response.body))
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
