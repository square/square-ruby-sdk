
module Square
  module Orders
    module CustomAttributes
      class Client
        # @option client [Square::Internal::Http::RawClient]
        #
        # @return [Square::Orders::CustomAttributes::Client]
        def initialize(client)
          @client = client
        end

        # Deletes order [custom attributes](entity:CustomAttribute) as a bulk operation.
        # 
        # Use this endpoint to delete one or more custom attributes from one or more orders.
        # A custom attribute is based on a custom attribute definition in a Square seller account.  (To create a
        # custom attribute definition, use the [CreateOrderCustomAttributeDefinition](api-endpoint:OrderCustomAttributes-CreateOrderCustomAttributeDefinition) endpoint.)
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
        # @return [Square::Types::BulkDeleteOrderCustomAttributesResponse]
        def batch_delete(request_options: {}, **params)
          _request = params
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Square::Types::BulkDeleteOrderCustomAttributesResponse.load(_response.body)
          else
            raise _response.body
          end
        end

        # Creates or updates order [custom attributes](entity:CustomAttribute) as a bulk operation.
        # 
        # Use this endpoint to delete one or more custom attributes from one or more orders.
        # A custom attribute is based on a custom attribute definition in a Square seller account.  (To create a
        # custom attribute definition, use the [CreateOrderCustomAttributeDefinition](api-endpoint:OrderCustomAttributes-CreateOrderCustomAttributeDefinition) endpoint.)
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
        # @return [Square::Types::BulkUpsertOrderCustomAttributesResponse]
        def batch_upsert(request_options: {}, **params)
          _request = params
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Square::Types::BulkUpsertOrderCustomAttributesResponse.load(_response.body)
          else
            raise _response.body
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
        # @return [Square::Types::ListOrderCustomAttributesResponse]
        def list(request_options: {}, **params)
          _request = params
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Square::Types::ListOrderCustomAttributesResponse.load(_response.body)
          else
            raise _response.body
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
        # @return [Square::Types::RetrieveOrderCustomAttributeResponse]
        def get(request_options: {}, **params)
          _request = params
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Square::Types::RetrieveOrderCustomAttributeResponse.load(_response.body)
          else
            raise _response.body
          end
        end

        # Creates or updates a [custom attribute](entity:CustomAttribute) for an order.
        # 
        # Use this endpoint to set the value of a custom attribute for a specific order.
        # A custom attribute is based on a custom attribute definition in a Square seller account. (To create a
        # custom attribute definition, use the [CreateOrderCustomAttributeDefinition](api-endpoint:OrderCustomAttributes-CreateOrderCustomAttributeDefinition) endpoint.)
        # 
        # To create or update a custom attribute owned by another application, the `visibility` setting
        # must be `VISIBILITY_READ_WRITE_VALUES`. Note that seller-defined custom attributes
        # (also known as custom fields) are always set to `VISIBILITY_READ_WRITE_VALUES`.
        #
        # @return [Square::Types::UpsertOrderCustomAttributeResponse]
        def upsert(request_options: {}, **params)
          _request = params
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Square::Types::UpsertOrderCustomAttributeResponse.load(_response.body)
          else
            raise _response.body
          end
        end

        # Deletes a [custom attribute](entity:CustomAttribute) associated with a customer profile.
        # 
        # To delete a custom attribute owned by another application, the `visibility` setting must be
        # `VISIBILITY_READ_WRITE_VALUES`. Note that seller-defined custom attributes
        # (also known as custom fields) are always set to `VISIBILITY_READ_WRITE_VALUES`.
        #
        # @return [Square::Types::DeleteOrderCustomAttributeResponse]
        def delete(request_options: {}, **params)
          _request = params
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Square::Types::DeleteOrderCustomAttributeResponse.load(_response.body)
          else
            raise _response.body
          end
        end

      end
    end
  end
end
