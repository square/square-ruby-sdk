# frozen_string_literal: true

module Square
  module Merchants
    module CustomAttributes
      class Client
        # @return [Square::Merchants::CustomAttributes::Client]
        def initialize(client:)
          @client = client
        end

        # Deletes [custom attributes](entity:CustomAttribute) for a merchant as a bulk operation.
        # To delete a custom attribute owned by another application, the `visibility` setting must be
        # `VISIBILITY_READ_WRITE_VALUES`.
        #
        # @return [Square::Types::BulkDeleteMerchantCustomAttributesResponse]
        def batch_delete(request_options: {}, **params)
          _request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Square::Environment::PRODUCTION,
            method: "POST",
            path: "v2/merchants/custom-attributes/bulk-delete",
            body: params
          )
          begin
            _response = @client.send(_request)
          rescue Net::HTTPRequestTimeout
            raise Square::Errors::TimeoutError
          end
          code = _response.code.to_i
          if code.between?(200, 299)
            Square::Types::BulkDeleteMerchantCustomAttributesResponse.load(_response.body)
          else
            error_class = Square::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(_response.body, code: code)
          end
        end

        # Creates or updates [custom attributes](entity:CustomAttribute) for a merchant as a bulk operation.
        # Use this endpoint to set the value of one or more custom attributes for a merchant.
        # A custom attribute is based on a custom attribute definition in a Square seller account, which is
        # created using the [CreateMerchantCustomAttributeDefinition](api-endpoint:MerchantCustomAttributes-CreateMerchantCustomAttributeDefinition) endpoint.
        # This `BulkUpsertMerchantCustomAttributes` endpoint accepts a map of 1 to 25 individual upsert
        # requests and returns a map of individual upsert responses. Each upsert request has a unique ID
        # and provides a merchant ID and custom attribute. Each upsert response is returned with the ID
        # of the corresponding request.
        # To create or update a custom attribute owned by another application, the `visibility` setting
        # must be `VISIBILITY_READ_WRITE_VALUES`.
        #
        # @return [Square::Types::BulkUpsertMerchantCustomAttributesResponse]
        def batch_upsert(request_options: {}, **params)
          _request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Square::Environment::PRODUCTION,
            method: "POST",
            path: "v2/merchants/custom-attributes/bulk-upsert",
            body: params
          )
          begin
            _response = @client.send(_request)
          rescue Net::HTTPRequestTimeout
            raise Square::Errors::TimeoutError
          end
          code = _response.code.to_i
          if code.between?(200, 299)
            Square::Types::BulkUpsertMerchantCustomAttributesResponse.load(_response.body)
          else
            error_class = Square::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(_response.body, code: code)
          end
        end

        # Lists the [custom attributes](entity:CustomAttribute) associated with a merchant.
        # You can use the `with_definitions` query parameter to also retrieve custom attribute definitions
        # in the same call.
        # When all response pages are retrieved, the results include all custom attributes that are
        # visible to the requesting application, including those that are owned by other applications
        # and set to `VISIBILITY_READ_ONLY` or `VISIBILITY_READ_WRITE_VALUES`.
        #
        # @return [Square::Types::ListMerchantCustomAttributesResponse]
        def list(request_options: {}, **params)
          _query_param_names = [
            %w[visibility_filter limit cursor with_definitions],
            %i[visibility_filter limit cursor with_definitions]
          ].flatten
          _query = params.slice(*_query_param_names)
          params = params.except(*_query_param_names)

          _request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Square::Environment::PRODUCTION,
            method: "GET",
            path: "v2/merchants/#{params[:merchant_id]}/custom-attributes",
            query: _query
          )
          begin
            _response = @client.send(_request)
          rescue Net::HTTPRequestTimeout
            raise Square::Errors::TimeoutError
          end
          code = _response.code.to_i
          if code.between?(200, 299)
            Square::Types::ListMerchantCustomAttributesResponse.load(_response.body)
          else
            error_class = Square::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(_response.body, code: code)
          end
        end

        # Retrieves a [custom attribute](entity:CustomAttribute) associated with a merchant.
        # You can use the `with_definition` query parameter to also retrieve the custom attribute definition
        # in the same call.
        # To retrieve a custom attribute owned by another application, the `visibility` setting must be
        # `VISIBILITY_READ_ONLY` or `VISIBILITY_READ_WRITE_VALUES`.
        #
        # @return [Square::Types::RetrieveMerchantCustomAttributeResponse]
        def get(request_options: {}, **params)
          _query_param_names = [
            %w[with_definition version],
            %i[with_definition version]
          ].flatten
          _query = params.slice(*_query_param_names)
          params = params.except(*_query_param_names)

          _request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Square::Environment::PRODUCTION,
            method: "GET",
            path: "v2/merchants/#{params[:merchant_id]}/custom-attributes/#{params[:key]}",
            query: _query
          )
          begin
            _response = @client.send(_request)
          rescue Net::HTTPRequestTimeout
            raise Square::Errors::TimeoutError
          end
          code = _response.code.to_i
          if code.between?(200, 299)
            Square::Types::RetrieveMerchantCustomAttributeResponse.load(_response.body)
          else
            error_class = Square::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(_response.body, code: code)
          end
        end

        # Creates or updates a [custom attribute](entity:CustomAttribute) for a merchant.
        # Use this endpoint to set the value of a custom attribute for a specified merchant.
        # A custom attribute is based on a custom attribute definition in a Square seller account, which
        # is created using the [CreateMerchantCustomAttributeDefinition](api-endpoint:MerchantCustomAttributes-CreateMerchantCustomAttributeDefinition) endpoint.
        # To create or update a custom attribute owned by another application, the `visibility` setting
        # must be `VISIBILITY_READ_WRITE_VALUES`.
        #
        # @return [Square::Types::UpsertMerchantCustomAttributeResponse]
        def upsert(request_options: {}, **params)
          _path_param_names = %w[merchant_id key]

          _request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Square::Environment::PRODUCTION,
            method: "POST",
            path: "v2/merchants/#{params[:merchant_id]}/custom-attributes/#{params[:key]}",
            body: params.except(*_path_param_names)
          )
          begin
            _response = @client.send(_request)
          rescue Net::HTTPRequestTimeout
            raise Square::Errors::TimeoutError
          end
          code = _response.code.to_i
          if code.between?(200, 299)
            Square::Types::UpsertMerchantCustomAttributeResponse.load(_response.body)
          else
            error_class = Square::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(_response.body, code: code)
          end
        end

        # Deletes a [custom attribute](entity:CustomAttribute) associated with a merchant.
        # To delete a custom attribute owned by another application, the `visibility` setting must be
        # `VISIBILITY_READ_WRITE_VALUES`.
        #
        # @return [Square::Types::DeleteMerchantCustomAttributeResponse]
        def delete(request_options: {}, **params)
          _request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Square::Environment::PRODUCTION,
            method: "DELETE",
            path: "v2/merchants/#{params[:merchant_id]}/custom-attributes/#{params[:key]}"
          )
          begin
            _response = @client.send(_request)
          rescue Net::HTTPRequestTimeout
            raise Square::Errors::TimeoutError
          end
          code = _response.code.to_i
          if code.between?(200, 299)
            Square::Types::DeleteMerchantCustomAttributeResponse.load(_response.body)
          else
            error_class = Square::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(_response.body, code: code)
          end
        end
      end
    end
  end
end
