
module Square
  module Merchants
    module CustomAttributes
      class Client
        # @option client [Square::Internal::Http::RawClient]
        #
        # @return [Square::Merchants::CustomAttributes::Client]
        def initialize(client)
          @client = client
        end

        # Deletes [custom attributes](entity:CustomAttribute) for a merchant as a bulk operation.
        # To delete a custom attribute owned by another application, the `visibility` setting must be
        # `VISIBILITY_READ_WRITE_VALUES`.
        #
        # @return [Square::BulkDeleteMerchantCustomAttributesResponse]
        def batch_delete(request_options: {}, **params)
          _request = params

          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Square::Types::BulkDeleteMerchantCustomAttributesResponse.load(_response.body)

          else
            raise _response.body
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
        # @return [Square::BulkUpsertMerchantCustomAttributesResponse]
        def batch_upsert(request_options: {}, **params)
          _request = params

          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Square::Types::BulkUpsertMerchantCustomAttributesResponse.load(_response.body)

          else
            raise _response.body
        end

        # Lists the [custom attributes](entity:CustomAttribute) associated with a merchant.
        # You can use the `with_definitions` query parameter to also retrieve custom attribute definitions
        # in the same call.
        # When all response pages are retrieved, the results include all custom attributes that are
        # visible to the requesting application, including those that are owned by other applications
        # and set to `VISIBILITY_READ_ONLY` or `VISIBILITY_READ_WRITE_VALUES`.
        #
        # @return [Square::ListMerchantCustomAttributesResponse]
        def list(request_options: {}, **params)
          _request = params

          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Square::Types::ListMerchantCustomAttributesResponse.load(_response.body)

          else
            raise _response.body
        end

        # Retrieves a [custom attribute](entity:CustomAttribute) associated with a merchant.
        # You can use the `with_definition` query parameter to also retrieve the custom attribute definition
        # in the same call.
        # To retrieve a custom attribute owned by another application, the `visibility` setting must be
        # `VISIBILITY_READ_ONLY` or `VISIBILITY_READ_WRITE_VALUES`.
        #
        # @return [Square::RetrieveMerchantCustomAttributeResponse]
        def get(request_options: {}, **params)
          _request = params

          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Square::Types::RetrieveMerchantCustomAttributeResponse.load(_response.body)

          else
            raise _response.body
        end

        # Creates or updates a [custom attribute](entity:CustomAttribute) for a merchant.
        # Use this endpoint to set the value of a custom attribute for a specified merchant.
        # A custom attribute is based on a custom attribute definition in a Square seller account, which
        # is created using the [CreateMerchantCustomAttributeDefinition](api-endpoint:MerchantCustomAttributes-CreateMerchantCustomAttributeDefinition) endpoint.
        # To create or update a custom attribute owned by another application, the `visibility` setting
        # must be `VISIBILITY_READ_WRITE_VALUES`.
        #
        # @return [Square::UpsertMerchantCustomAttributeResponse]
        def upsert(request_options: {}, **params)
          _request = params

          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Square::Types::UpsertMerchantCustomAttributeResponse.load(_response.body)

          else
            raise _response.body
        end

        # Deletes a [custom attribute](entity:CustomAttribute) associated with a merchant.
        # To delete a custom attribute owned by another application, the `visibility` setting must be
        # `VISIBILITY_READ_WRITE_VALUES`.
        #
        # @return [Square::DeleteMerchantCustomAttributeResponse]
        def delete(request_options: {}, **params)
          _request = params

          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Square::Types::DeleteMerchantCustomAttributeResponse.load(_response.body)

          else
            raise _response.body
        end

      end
    end
  end
end
