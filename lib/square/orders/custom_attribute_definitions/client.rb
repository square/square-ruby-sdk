# frozen_string_literal: true

module Square
  module Orders
    module CustomAttributeDefinitions
      class Client
        # @return [Square::Orders::CustomAttributeDefinitions::Client]
        def initialize(client:)
          @client = client
        end

        # Lists the order-related [custom attribute definitions](entity:CustomAttributeDefinition) that belong to a Square seller account.
        #
        # When all response pages are retrieved, the results include all custom attribute definitions
        # that are visible to the requesting application, including those that are created by other
        # applications and set to `VISIBILITY_READ_ONLY` or `VISIBILITY_READ_WRITE_VALUES`. Note that
        # seller-defined custom attributes (also known as custom fields) are always set to `VISIBILITY_READ_WRITE_VALUES`.
        #
        # @return [Square::Types::ListOrderCustomAttributeDefinitionsResponse]
        def list(request_options: {}, **params)
          _query_param_names = [
            %w[visibility_filter cursor limit],
            %i[visibility_filter cursor limit]
          ].flatten
          _query = params.slice(*_query_param_names)
          params.except(*_query_param_names)

          _request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Square::Environment::SANDBOX,
            method: "GET",
            path: "v2/orders/custom-attribute-definitions",
            query: _query
          )
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Square::Types::ListOrderCustomAttributeDefinitionsResponse.load(_response.body)
          end

          raise _response.body
        end

        # Creates an order-related custom attribute definition.  Use this endpoint to
        # define a custom attribute that can be associated with orders.
        #
        # After creating a custom attribute definition, you can set the custom attribute for orders
        # in the Square seller account.
        #
        # @return [Square::Types::CreateOrderCustomAttributeDefinitionResponse]
        def create(request_options: {}, **params)
          _request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Square::Environment::SANDBOX,
            method: "POST",
            path: "v2/orders/custom-attribute-definitions",
            body: params
          )
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Square::Types::CreateOrderCustomAttributeDefinitionResponse.load(_response.body)
          end

          raise _response.body
        end

        # Retrieves an order-related [custom attribute definition](entity:CustomAttributeDefinition) from a Square seller account.
        #
        # To retrieve a custom attribute definition created by another application, the `visibility`
        # setting must be `VISIBILITY_READ_ONLY` or `VISIBILITY_READ_WRITE_VALUES`. Note that seller-defined custom attributes
        # (also known as custom fields) are always set to `VISIBILITY_READ_WRITE_VALUES`.
        #
        # @return [Square::Types::RetrieveOrderCustomAttributeDefinitionResponse]
        def get(request_options: {}, **params)
          _query_param_names = [
            ["version"],
            %i[version]
          ].flatten
          _query = params.slice(*_query_param_names)
          params = params.except(*_query_param_names)

          _request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Square::Environment::SANDBOX,
            method: "GET",
            path: "v2/orders/custom-attribute-definitions/#{params[:key]}",
            query: _query
          )
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Square::Types::RetrieveOrderCustomAttributeDefinitionResponse.load(_response.body)
          end

          raise _response.body
        end

        # Updates an order-related custom attribute definition for a Square seller account.
        #
        # Only the definition owner can update a custom attribute definition. Note that sellers can view all custom attributes in exported customer data, including those set to `VISIBILITY_HIDDEN`.
        #
        # @return [Square::Types::UpdateOrderCustomAttributeDefinitionResponse]
        def update(request_options: {}, **params)
          _path_param_names = ["key"]

          _request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Square::Environment::SANDBOX,
            method: "PUT",
            path: "v2/orders/custom-attribute-definitions/#{params[:key]}",
            body: params.except(*_path_param_names)
          )
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Square::Types::UpdateOrderCustomAttributeDefinitionResponse.load(_response.body)
          end

          raise _response.body
        end

        # Deletes an order-related [custom attribute definition](entity:CustomAttributeDefinition) from a Square seller account.
        #
        # Only the definition owner can delete a custom attribute definition.
        #
        # @return [Square::Types::DeleteOrderCustomAttributeDefinitionResponse]
        def delete(request_options: {}, **params)
          _request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Square::Environment::SANDBOX,
            method: "DELETE",
            path: "v2/orders/custom-attribute-definitions/#{params[:key]}"
          )
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Square::Types::DeleteOrderCustomAttributeDefinitionResponse.load(_response.body)
          end

          raise _response.body
        end
      end
    end
  end
end
