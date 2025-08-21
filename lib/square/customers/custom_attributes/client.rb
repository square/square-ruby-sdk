# frozen_string_literal: true

module Square
  module Customers
    module CustomAttributes
      class Client
        # @return [Square::Customers::CustomAttributes::Client]
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
        # @return [Square::Types::ListCustomerCustomAttributesResponse]
        def list(request_options: {}, **params)
          _query_param_names = %w[limit cursor with_definitions]
          _query = params.slice(*_query_param_names)
          params = params.except(*_query_param_names)

          _request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Square::Environment::SANDBOX,
            method: "GET",
            path: "v2/customers/#{params[:customer_id]}/custom-attributes",
            query: _query
          )
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Square::Types::ListCustomerCustomAttributesResponse.load(_response.body)
          end

          raise _response.body
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
        # @return [Square::Types::GetCustomerCustomAttributeResponse]
        def get(request_options: {}, **params)
          _query_param_names = %w[with_definition version]
          _query = params.slice(*_query_param_names)
          params = params.except(*_query_param_names)

          _request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Square::Environment::SANDBOX,
            method: "GET",
            path: "v2/customers/#{params[:customer_id]}/custom-attributes/#{params[:key]}",
            query: _query
          )
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Square::Types::GetCustomerCustomAttributeResponse.load(_response.body)
          end

          raise _response.body
        end

        # Creates or updates a [custom attribute](entity:CustomAttribute) for a customer profile.
        #
        # Use this endpoint to set the value of a custom attribute for a specified customer profile.
        # A custom attribute is based on a custom attribute definition in a Square seller account, which
        # is created using the [CreateCustomerCustomAttributeDefinition](api-endpoint:CustomerCustomAttributes-CreateCustomerCustomAttributeDefinition) endpoint.
        #
        # To create or update a custom attribute owned by another application, the `visibility` setting
        # must be `VISIBILITY_READ_WRITE_VALUES`. Note that seller-defined custom attributes
        # (also known as custom fields) are always set to `VISIBILITY_READ_WRITE_VALUES`.
        #
        # @return [Square::Types::UpsertCustomerCustomAttributeResponse]
        def upsert(request_options: {}, **params)
          _path_param_names = %w[customer_id key]

          _request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Square::Environment::SANDBOX,
            method: "POST",
            path: "v2/customers/#{params[:customer_id]}/custom-attributes/#{params[:key]}",
            body: params.except(*_path_param_names)
          )
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Square::Types::UpsertCustomerCustomAttributeResponse.load(_response.body)
          end

          raise _response.body
        end

        # Deletes a [custom attribute](entity:CustomAttribute) associated with a customer profile.
        #
        # To delete a custom attribute owned by another application, the `visibility` setting must be
        # `VISIBILITY_READ_WRITE_VALUES`. Note that seller-defined custom attributes
        # (also known as custom fields) are always set to `VISIBILITY_READ_WRITE_VALUES`.
        #
        # @return [Square::Types::DeleteCustomerCustomAttributeResponse]
        def delete(request_options: {}, **params)
          _request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Square::Environment::SANDBOX,
            method: "DELETE",
            path: "v2/customers/#{params[:customer_id]}/custom-attributes/#{params[:key]}"
          )
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Square::Types::DeleteCustomerCustomAttributeResponse.load(_response.body)
          end

          raise _response.body
        end
      end
    end
  end
end
