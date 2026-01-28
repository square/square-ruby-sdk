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
        # @return [Square::Types::ListCustomerCustomAttributesResponse]
        def list(request_options: {}, **params)
          params = Square::Internal::Types::Utils.normalize_keys(params)
          query_param_names = %i[limit cursor with_definitions]
          query_params = {}
          query_params["limit"] = params[:limit] if params.key?(:limit)
          query_params["cursor"] = params[:cursor] if params.key?(:cursor)
          query_params["with_definitions"] = params[:with_definitions] if params.key?(:with_definitions)
          params = params.except(*query_param_names)

          Square::Internal::CursorItemIterator.new(
            cursor_field: :cursor,
            item_field: :custom_attributes,
            initial_cursor: query_params[:cursor]
          ) do |next_cursor|
            query_params[:cursor] = next_cursor
            request = Square::Internal::JSON::Request.new(
              base_url: request_options[:base_url],
              method: "GET",
              path: "v2/customers/#{params[:customer_id]}/custom-attributes",
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
              Square::Types::ListCustomerCustomAttributesResponse.load(response.body)
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
        # @return [Square::Types::GetCustomerCustomAttributeResponse]
        def get(request_options: {}, **params)
          params = Square::Internal::Types::Utils.normalize_keys(params)
          query_param_names = %i[with_definition version]
          query_params = {}
          query_params["with_definition"] = params[:with_definition] if params.key?(:with_definition)
          query_params["version"] = params[:version] if params.key?(:version)
          params = params.except(*query_param_names)

          request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "GET",
            path: "v2/customers/#{params[:customer_id]}/custom-attributes/#{params[:key]}",
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
            Square::Types::GetCustomerCustomAttributeResponse.load(response.body)
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
        # @return [Square::Types::UpsertCustomerCustomAttributeResponse]
        def upsert(request_options: {}, **params)
          params = Square::Internal::Types::Utils.normalize_keys(params)
          request_data = Square::Customers::CustomAttributes::Types::UpsertCustomerCustomAttributeRequest.new(params).to_h
          non_body_param_names = %w[customer_id key]
          body = request_data.except(*non_body_param_names)

          request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "POST",
            path: "v2/customers/#{params[:customer_id]}/custom-attributes/#{params[:key]}",
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
            Square::Types::UpsertCustomerCustomAttributeResponse.load(response.body)
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
        # @return [Square::Types::DeleteCustomerCustomAttributeResponse]
        def delete(request_options: {}, **params)
          params = Square::Internal::Types::Utils.normalize_keys(params)
          request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "DELETE",
            path: "v2/customers/#{params[:customer_id]}/custom-attributes/#{params[:key]}",
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Square::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Square::Types::DeleteCustomerCustomAttributeResponse.load(response.body)
          else
            error_class = Square::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end
      end
    end
  end
end
