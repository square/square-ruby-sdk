# frozen_string_literal: true

module Square
  module Orders
    module CustomAttributes
      class Client
        # @param client [Square::Internal::Http::RawClient]
        #
        # @return [void]
        def initialize(client:)
          @client = client
        end

        # Deletes order [custom attributes](entity:CustomAttribute) as a bulk operation.
        #
        # Use this endpoint to delete one or more custom attributes from one or more orders.
        # A custom attribute is based on a custom attribute definition in a Square seller account.  (To create a
        # custom attribute definition, use the
        # [CreateOrderCustomAttributeDefinition](api-endpoint:OrderCustomAttributes-CreateOrderCustomAttributeDefinition)
        # endpoint.)
        #
        # This `BulkDeleteOrderCustomAttributes` endpoint accepts a map of 1 to 25 individual delete
        # requests and returns a map of individual delete responses. Each delete request has a unique ID
        # and provides an order ID and custom attribute. Each delete response is returned with the ID
        # of the corresponding request.
        #
        # To delete a custom attribute owned by another application, the `visibility` setting
        # must be `VISIBILITY_READ_WRITE_VALUES`. Note that seller-defined custom attributes
        # (also known as custom fields) are always set to `VISIBILITY_READ_WRITE_VALUES`.
        #
        # @param request_options [Hash]
        # @param params [Square::Orders::CustomAttributes::Types::BulkDeleteOrderCustomAttributesRequest]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        #
        # @return [Square::Types::BulkDeleteOrderCustomAttributesResponse]
        def batch_delete(request_options: {}, **params)
          params = Square::Internal::Types::Utils.normalize_keys(params)
          request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "POST",
            path: "v2/orders/custom-attributes/bulk-delete",
            body: Square::Orders::CustomAttributes::Types::BulkDeleteOrderCustomAttributesRequest.new(params).to_h,
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Square::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Square::Types::BulkDeleteOrderCustomAttributesResponse.load(response.body)
          else
            error_class = Square::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Creates or updates order [custom attributes](entity:CustomAttribute) as a bulk operation.
        #
        # Use this endpoint to delete one or more custom attributes from one or more orders.
        # A custom attribute is based on a custom attribute definition in a Square seller account.  (To create a
        # custom attribute definition, use the
        # [CreateOrderCustomAttributeDefinition](api-endpoint:OrderCustomAttributes-CreateOrderCustomAttributeDefinition)
        # endpoint.)
        #
        # This `BulkUpsertOrderCustomAttributes` endpoint accepts a map of 1 to 25 individual upsert
        # requests and returns a map of individual upsert responses. Each upsert request has a unique ID
        # and provides an order ID and custom attribute. Each upsert response is returned with the ID
        # of the corresponding request.
        #
        # To create or update a custom attribute owned by another application, the `visibility` setting
        # must be `VISIBILITY_READ_WRITE_VALUES`. Note that seller-defined custom attributes
        # (also known as custom fields) are always set to `VISIBILITY_READ_WRITE_VALUES`.
        #
        # @param request_options [Hash]
        # @param params [Square::Orders::CustomAttributes::Types::BulkUpsertOrderCustomAttributesRequest]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        #
        # @return [Square::Types::BulkUpsertOrderCustomAttributesResponse]
        def batch_upsert(request_options: {}, **params)
          params = Square::Internal::Types::Utils.normalize_keys(params)
          request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "POST",
            path: "v2/orders/custom-attributes/bulk-upsert",
            body: Square::Orders::CustomAttributes::Types::BulkUpsertOrderCustomAttributesRequest.new(params).to_h,
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Square::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Square::Types::BulkUpsertOrderCustomAttributesResponse.load(response.body)
          else
            error_class = Square::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Lists the [custom attributes](entity:CustomAttribute) associated with an order.
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
        # @option params [String] :order_id
        # @option params [Square::Types::VisibilityFilter, nil] :visibility_filter
        # @option params [String, nil] :cursor
        # @option params [Integer, nil] :limit
        # @option params [Boolean, nil] :with_definitions
        #
        # @return [Square::Types::ListOrderCustomAttributesResponse]
        def list(request_options: {}, **params)
          params = Square::Internal::Types::Utils.normalize_keys(params)
          query_param_names = %i[visibility_filter cursor limit with_definitions]
          query_params = {}
          query_params["visibility_filter"] = params[:visibility_filter] if params.key?(:visibility_filter)
          query_params["cursor"] = params[:cursor] if params.key?(:cursor)
          query_params["limit"] = params[:limit] if params.key?(:limit)
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
              path: "v2/orders/#{params[:order_id]}/custom-attributes",
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
              Square::Types::ListOrderCustomAttributesResponse.load(response.body)
            else
              error_class = Square::Errors::ResponseError.subclass_for_code(code)
              raise error_class.new(response.body, code: code)
            end
          end
        end

        # Retrieves a [custom attribute](entity:CustomAttribute) associated with an order.
        #
        # You can use the `with_definition` query parameter to also retrieve the custom attribute definition
        # in the same call.
        #
        # To retrieve a custom attribute owned by another application, the `visibility` setting must be
        # `VISIBILITY_READ_ONLY` or `VISIBILITY_READ_WRITE_VALUES`. Note that seller-defined custom attributes
        # also known as custom fields) are always set to `VISIBILITY_READ_WRITE_VALUES`.
        #
        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :order_id
        # @option params [String] :custom_attribute_key
        # @option params [Integer, nil] :version
        # @option params [Boolean, nil] :with_definition
        #
        # @return [Square::Types::RetrieveOrderCustomAttributeResponse]
        def get(request_options: {}, **params)
          params = Square::Internal::Types::Utils.normalize_keys(params)
          query_param_names = %i[version with_definition]
          query_params = {}
          query_params["version"] = params[:version] if params.key?(:version)
          query_params["with_definition"] = params[:with_definition] if params.key?(:with_definition)
          params = params.except(*query_param_names)

          request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "GET",
            path: "v2/orders/#{params[:order_id]}/custom-attributes/#{params[:custom_attribute_key]}",
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
            Square::Types::RetrieveOrderCustomAttributeResponse.load(response.body)
          else
            error_class = Square::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Creates or updates a [custom attribute](entity:CustomAttribute) for an order.
        #
        # Use this endpoint to set the value of a custom attribute for a specific order.
        # A custom attribute is based on a custom attribute definition in a Square seller account. (To create a
        # custom attribute definition, use the
        # [CreateOrderCustomAttributeDefinition](api-endpoint:OrderCustomAttributes-CreateOrderCustomAttributeDefinition)
        # endpoint.)
        #
        # To create or update a custom attribute owned by another application, the `visibility` setting
        # must be `VISIBILITY_READ_WRITE_VALUES`. Note that seller-defined custom attributes
        # (also known as custom fields) are always set to `VISIBILITY_READ_WRITE_VALUES`.
        #
        # @param request_options [Hash]
        # @param params [Square::Orders::CustomAttributes::Types::UpsertOrderCustomAttributeRequest]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :order_id
        # @option params [String] :custom_attribute_key
        #
        # @return [Square::Types::UpsertOrderCustomAttributeResponse]
        def upsert(request_options: {}, **params)
          params = Square::Internal::Types::Utils.normalize_keys(params)
          request_data = Square::Orders::CustomAttributes::Types::UpsertOrderCustomAttributeRequest.new(params).to_h
          non_body_param_names = %w[order_id custom_attribute_key]
          body = request_data.except(*non_body_param_names)

          request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "POST",
            path: "v2/orders/#{params[:order_id]}/custom-attributes/#{params[:custom_attribute_key]}",
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
            Square::Types::UpsertOrderCustomAttributeResponse.load(response.body)
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
        # @option params [String] :order_id
        # @option params [String] :custom_attribute_key
        #
        # @return [Square::Types::DeleteOrderCustomAttributeResponse]
        def delete(request_options: {}, **params)
          params = Square::Internal::Types::Utils.normalize_keys(params)
          request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "DELETE",
            path: "v2/orders/#{params[:order_id]}/custom-attributes/#{params[:custom_attribute_key]}",
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Square::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Square::Types::DeleteOrderCustomAttributeResponse.load(response.body)
          else
            error_class = Square::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end
      end
    end
  end
end
