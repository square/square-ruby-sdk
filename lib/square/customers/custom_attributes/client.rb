# frozen_string_literal: true

module Square
  module Customers
    module CustomAttributes
      class Client
        # @param client [Square::Internal::Http::RawClient]
        #
        # @return [void]
        def initialize(client:)
          @client = client
        end

        # Lists the [custom attributes](entity:CustomAttribute) associated with a customer profile.
        #
        # You can use the `with_definitions` query parameter to also retrieve custom attribute definitions
        # in the same call.
        #
        # When all response pages are retrieved, the results include all custom attributes that are
        # visible to the requesting application, including those that are owned by other applications
        # and set to `VISIBILITY_READ_ONLY` or `VISIBILITY_READ_WRITE_VALUES`.
        #
        # Returns a `Square::Internal::CursorItemIterator` that yields each `Square::Types::CustomAttribute` in the
        # `custom_attributes` field of every page, requesting pages as they are needed. Call `pages` on it to get each
        # page as a `Square::Types::ListCustomerCustomAttributesResponse`, including its other fields.
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
        # @option params [String] :customer_id
        # @option params [Integer, nil] :limit
        # @option params [String, nil] :cursor
        # @option params [Boolean, nil] :with_definitions
        #
        # @example
        #   client.customers.custom_attributes.list(
        #     customer_id: "customer_id",
        #     limit: 1,
        #     cursor: "cursor",
        #     with_definitions: true
        #   )
        #
        # @return [Square::Internal::CursorItemIterator]
        def list(request_options: {}, **params)
          params = Square::Internal::Types::Utils.normalize_keys(params)
          query_params = {}
          query_params["limit"] = params[:limit] if params.key?(:limit)
          query_params["cursor"] = params[:cursor] if params.key?(:cursor)
          query_params["with_definitions"] = params[:with_definitions] if params.key?(:with_definitions)

          Square::Internal::CursorItemIterator.new(
            cursor_field: :cursor,
            item_field: :custom_attributes,
            initial_cursor: query_params["cursor"]
          ) do |next_cursor|
            query_params["cursor"] = next_cursor
            request = Square::Internal::JSON::Request.new(
              base_url: request_options[:base_url],
              method: "GET",
              path: "v2/customers/#{URI.encode_uri_component(params[:customer_id].to_s)}/custom-attributes",
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
              parsed_response = (response.body.to_s.empty? ? nil : Square::Types::ListCustomerCustomAttributesResponse.load(response.body))
              [parsed_response, response]
            else
              error_class = Square::Errors::ResponseError.subclass_for_code(code)
              raise error_class.new(response.body, code: code)
            end
          end
        end

        # Retrieves a [custom attribute](entity:CustomAttribute) associated with a customer profile.
        #
        # You can use the `with_definition` query parameter to also retrieve the custom attribute definition
        # in the same call.
        #
        # To retrieve a custom attribute owned by another application, the `visibility` setting must be
        # `VISIBILITY_READ_ONLY` or `VISIBILITY_READ_WRITE_VALUES`. Note that seller-defined custom attributes
        # (also known as custom fields) are always set to `VISIBILITY_READ_WRITE_VALUES`.
        #
        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :customer_id
        # @option params [String] :key
        # @option params [Boolean, nil] :with_definition
        # @option params [Integer, nil] :version
        #
        # @example
        #   client.customers.custom_attributes.get(
        #     customer_id: "customer_id",
        #     key: "key",
        #     with_definition: true,
        #     version: 1
        #   )
        #
        # @return [Square::Types::GetCustomerCustomAttributeResponse]
        def get(request_options: {}, **params)
          params = Square::Internal::Types::Utils.normalize_keys(params)
          query_params = {}
          query_params["with_definition"] = params[:with_definition] if params.key?(:with_definition)
          query_params["version"] = params[:version] if params.key?(:version)

          request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "GET",
            path: "v2/customers/#{URI.encode_uri_component(params[:customer_id].to_s)}/custom-attributes/#{URI.encode_uri_component(params[:key].to_s)}",
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
            (response.body.to_s.empty? ? nil : Square::Types::GetCustomerCustomAttributeResponse.load(response.body))
          else
            error_class = Square::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Creates or updates a [custom attribute](entity:CustomAttribute) for a customer profile.
        #
        # Use this endpoint to set the value of a custom attribute for a specified customer profile.
        # A custom attribute is based on a custom attribute definition in a Square seller account, which
        # is created using the
        # [CreateCustomerCustomAttributeDefinition](api-endpoint:CustomerCustomAttributes-CreateCustomerCustomAttributeDefinition)
        # endpoint.
        #
        # To create or update a custom attribute owned by another application, the `visibility` setting
        # must be `VISIBILITY_READ_WRITE_VALUES`. Note that seller-defined custom attributes
        # (also known as custom fields) are always set to `VISIBILITY_READ_WRITE_VALUES`.
        #
        # @param request_options [Hash]
        # @param params [Square::Customers::CustomAttributes::Types::UpsertCustomerCustomAttributeRequest]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :customer_id
        # @option params [String] :key
        #
        # @example
        #   client.customers.custom_attributes.upsert(
        #     customer_id: "customer_id",
        #     key: "key",
        #     custom_attribute: {
        #       value: "Dune"
        #     }
        #   )
        #
        # @return [Square::Types::UpsertCustomerCustomAttributeResponse]
        def upsert(request_options: {}, **params)
          params = Square::Internal::Types::Utils.normalize_keys(params)
          request_data = Square::Customers::CustomAttributes::Types::UpsertCustomerCustomAttributeRequest.new(params).to_h
          non_body_param_names = %w[customer_id key]
          body = request_data.except(*non_body_param_names)

          request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "POST",
            path: "v2/customers/#{URI.encode_uri_component(params[:customer_id].to_s)}/custom-attributes/#{URI.encode_uri_component(params[:key].to_s)}",
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
            (response.body.to_s.empty? ? nil : Square::Types::UpsertCustomerCustomAttributeResponse.load(response.body))
          else
            error_class = Square::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Deletes a [custom attribute](entity:CustomAttribute) associated with a customer profile.
        #
        # To delete a custom attribute owned by another application, the `visibility` setting must be
        # `VISIBILITY_READ_WRITE_VALUES`. Note that seller-defined custom attributes
        # (also known as custom fields) are always set to `VISIBILITY_READ_WRITE_VALUES`.
        #
        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :customer_id
        # @option params [String] :key
        #
        # @example
        #   client.customers.custom_attributes.delete(
        #     customer_id: "customer_id",
        #     key: "key"
        #   )
        #
        # @return [Square::Types::DeleteCustomerCustomAttributeResponse]
        def delete(request_options: {}, **params)
          params = Square::Internal::Types::Utils.normalize_keys(params)
          request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "DELETE",
            path: "v2/customers/#{URI.encode_uri_component(params[:customer_id].to_s)}/custom-attributes/#{URI.encode_uri_component(params[:key].to_s)}",
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Square::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            (response.body.to_s.empty? ? nil : Square::Types::DeleteCustomerCustomAttributeResponse.load(response.body))
          else
            error_class = Square::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end
      end
    end
  end
end
