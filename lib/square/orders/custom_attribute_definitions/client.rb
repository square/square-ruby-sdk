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
        # Returns a `Square::Internal::CursorItemIterator` that yields each `Square::Types::CustomAttributeDefinition`
        # in the `custom_attribute_definitions` field of every page, requesting pages as they are needed. Call `pages`
        # on it to get each page as a `Square::Types::ListOrderCustomAttributeDefinitionsResponse`, including its other
        # fields.
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
        # @option params [Square::Types::VisibilityFilter, nil] :visibility_filter
        # @option params [String, nil] :cursor
        # @option params [Integer, nil] :limit
        #
        # @example
        #   client.orders.custom_attribute_definitions.list(
        #     visibility_filter: "ALL",
        #     cursor: "cursor",
        #     limit: 1
        #   )
        #
        # @return [Square::Internal::CursorItemIterator]
        def list(request_options: {}, **params)
          params = Square::Internal::Types::Utils.normalize_keys(params)
          query_params = {}
          query_params["visibility_filter"] = params[:visibility_filter] if params.key?(:visibility_filter)
          query_params["cursor"] = params[:cursor] if params.key?(:cursor)
          query_params["limit"] = params[:limit] if params.key?(:limit)

          Square::Internal::CursorItemIterator.new(
            cursor_field: :cursor,
            item_field: :custom_attribute_definitions,
            initial_cursor: query_params["cursor"]
          ) do |next_cursor|
            query_params["cursor"] = next_cursor
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
              parsed_response = (response.body.to_s.empty? ? nil : Square::Types::ListOrderCustomAttributeDefinitionsResponse.load(response.body))
              [parsed_response, response]
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
        # @example
        #   client.orders.custom_attribute_definitions.create(
        #     custom_attribute_definition: {
        #       key: "cover-count",
        #       schema: {
        #         "$ref" => "https://developer-production-s.squarecdn.com/schemas/v1/common.json#squareup.common.Number"
        #       },
        #       name: "Cover count",
        #       description: "The number of people seated at a table",
        #       visibility: "VISIBILITY_READ_WRITE_VALUES"
        #     },
        #     idempotency_key: "IDEMPOTENCY_KEY"
        #   )
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
            (response.body.to_s.empty? ? nil : Square::Types::CreateOrderCustomAttributeDefinitionResponse.load(response.body))
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
        # @example
        #   client.orders.custom_attribute_definitions.get(
        #     key: "key",
        #     version: 1
        #   )
        #
        # @return [Square::Types::RetrieveOrderCustomAttributeDefinitionResponse]
        def get(request_options: {}, **params)
          params = Square::Internal::Types::Utils.normalize_keys(params)
          query_params = {}
          query_params["version"] = params[:version] if params.key?(:version)

          request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "GET",
            path: "v2/orders/custom-attribute-definitions/#{URI.encode_uri_component(params[:key].to_s)}",
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
            (response.body.to_s.empty? ? nil : Square::Types::RetrieveOrderCustomAttributeDefinitionResponse.load(response.body))
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
        # @example
        #   client.orders.custom_attribute_definitions.update(
        #     key: "key",
        #     custom_attribute_definition: {
        #       key: "cover-count",
        #       visibility: "VISIBILITY_READ_ONLY",
        #       version: 1
        #     },
        #     idempotency_key: "IDEMPOTENCY_KEY"
        #   )
        #
        # @return [Square::Types::UpdateOrderCustomAttributeDefinitionResponse]
        def update(request_options: {}, **params)
          params = Square::Internal::Types::Utils.normalize_keys(params)
          request_data = Square::Orders::CustomAttributeDefinitions::Types::UpdateOrderCustomAttributeDefinitionRequest.new(params).to_h
          non_body_param_names = %w[key]
          body = request_data.except(*non_body_param_names)

          request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "PUT",
            path: "v2/orders/custom-attribute-definitions/#{URI.encode_uri_component(params[:key].to_s)}",
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
            (response.body.to_s.empty? ? nil : Square::Types::UpdateOrderCustomAttributeDefinitionResponse.load(response.body))
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
        # @example
        #   client.orders.custom_attribute_definitions.delete(key: "key")
        #
        # @return [Square::Types::DeleteOrderCustomAttributeDefinitionResponse]
        def delete(request_options: {}, **params)
          params = Square::Internal::Types::Utils.normalize_keys(params)
          request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "DELETE",
            path: "v2/orders/custom-attribute-definitions/#{URI.encode_uri_component(params[:key].to_s)}",
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Square::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            (response.body.to_s.empty? ? nil : Square::Types::DeleteOrderCustomAttributeDefinitionResponse.load(response.body))
          else
            error_class = Square::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end
      end
    end
  end
end
