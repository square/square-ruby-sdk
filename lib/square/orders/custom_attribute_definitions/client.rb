# frozen_string_literal: true

module Square
  module Orders
    module CustomAttributeDefinitions
      class Client
        # @param client [Square::Internal::Http::RawClient]
        #
        # @return [void]
        def initialize(client:)
          @client = client
        end

        # Lists the order-related [custom attribute definitions](entity:CustomAttributeDefinition) that belong to a
        # Square seller account.
        #
        # When all response pages are retrieved, the results include all custom attribute definitions
        # that are visible to the requesting application, including those that are created by other
        # applications and set to `VISIBILITY_READ_ONLY` or `VISIBILITY_READ_WRITE_VALUES`. Note that
        # seller-defined custom attributes (also known as custom fields) are always set to
        # `VISIBILITY_READ_WRITE_VALUES`.
        #
        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [Square::Types::VisibilityFilter, nil] :visibility_filter
        # @option params [String, nil] :cursor
        # @option params [Integer, nil] :limit
        #
        # @return [Square::Types::ListOrderCustomAttributeDefinitionsResponse]
        def list(request_options: {}, **params)
          params = Square::Internal::Types::Utils.normalize_keys(params)
          query_param_names = %i[visibility_filter cursor limit]
          query_params = {}
          query_params["visibility_filter"] = params[:visibility_filter] if params.key?(:visibility_filter)
          query_params["cursor"] = params[:cursor] if params.key?(:cursor)
          query_params["limit"] = params[:limit] if params.key?(:limit)
          params.except(*query_param_names)

          Square::Internal::CursorItemIterator.new(
            cursor_field: :cursor,
            item_field: :custom_attribute_definitions,
            initial_cursor: query_params[:cursor]
          ) do |next_cursor|
            query_params[:cursor] = next_cursor
            request = Square::Internal::JSON::Request.new(
              base_url: request_options[:base_url],
              method: "GET",
              path: "v2/orders/custom-attribute-definitions",
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
              Square::Types::ListOrderCustomAttributeDefinitionsResponse.load(response.body)
            else
              error_class = Square::Errors::ResponseError.subclass_for_code(code)
              raise error_class.new(response.body, code: code)
            end
          end
        end

        # Creates an order-related custom attribute definition.  Use this endpoint to
        # define a custom attribute that can be associated with orders.
        #
        # After creating a custom attribute definition, you can set the custom attribute for orders
        # in the Square seller account.
        #
        # @param request_options [Hash]
        # @param params [Square::Orders::CustomAttributeDefinitions::Types::CreateOrderCustomAttributeDefinitionRequest]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        #
        # @return [Square::Types::CreateOrderCustomAttributeDefinitionResponse]
        def create(request_options: {}, **params)
          params = Square::Internal::Types::Utils.normalize_keys(params)
          request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "POST",
            path: "v2/orders/custom-attribute-definitions",
            body: Square::Orders::CustomAttributeDefinitions::Types::CreateOrderCustomAttributeDefinitionRequest.new(params).to_h,
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Square::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Square::Types::CreateOrderCustomAttributeDefinitionResponse.load(response.body)
          else
            error_class = Square::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Retrieves an order-related [custom attribute definition](entity:CustomAttributeDefinition) from a Square
        # seller account.
        #
        # To retrieve a custom attribute definition created by another application, the `visibility`
        # setting must be `VISIBILITY_READ_ONLY` or `VISIBILITY_READ_WRITE_VALUES`. Note that seller-defined custom
        # attributes
        # (also known as custom fields) are always set to `VISIBILITY_READ_WRITE_VALUES`.
        #
        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :key
        # @option params [Integer, nil] :version
        #
        # @return [Square::Types::RetrieveOrderCustomAttributeDefinitionResponse]
        def get(request_options: {}, **params)
          params = Square::Internal::Types::Utils.normalize_keys(params)
          query_param_names = %i[version]
          query_params = {}
          query_params["version"] = params[:version] if params.key?(:version)
          params = params.except(*query_param_names)

          request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "GET",
            path: "v2/orders/custom-attribute-definitions/#{params[:key]}",
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
            Square::Types::RetrieveOrderCustomAttributeDefinitionResponse.load(response.body)
          else
            error_class = Square::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Updates an order-related custom attribute definition for a Square seller account.
        #
        # Only the definition owner can update a custom attribute definition. Note that sellers can view all custom
        # attributes in exported customer data, including those set to `VISIBILITY_HIDDEN`.
        #
        # @param request_options [Hash]
        # @param params [Square::Orders::CustomAttributeDefinitions::Types::UpdateOrderCustomAttributeDefinitionRequest]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :key
        #
        # @return [Square::Types::UpdateOrderCustomAttributeDefinitionResponse]
        def update(request_options: {}, **params)
          params = Square::Internal::Types::Utils.normalize_keys(params)
          request_data = Square::Orders::CustomAttributeDefinitions::Types::UpdateOrderCustomAttributeDefinitionRequest.new(params).to_h
          non_body_param_names = ["key"]
          body = request_data.except(*non_body_param_names)

          request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "PUT",
            path: "v2/orders/custom-attribute-definitions/#{params[:key]}",
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
            Square::Types::UpdateOrderCustomAttributeDefinitionResponse.load(response.body)
          else
            error_class = Square::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Deletes an order-related [custom attribute definition](entity:CustomAttributeDefinition) from a Square seller
        # account.
        #
        # Only the definition owner can delete a custom attribute definition.
        #
        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :key
        #
        # @return [Square::Types::DeleteOrderCustomAttributeDefinitionResponse]
        def delete(request_options: {}, **params)
          params = Square::Internal::Types::Utils.normalize_keys(params)
          request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "DELETE",
            path: "v2/orders/custom-attribute-definitions/#{params[:key]}",
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Square::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Square::Types::DeleteOrderCustomAttributeDefinitionResponse.load(response.body)
          else
            error_class = Square::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end
      end
    end
  end
end
