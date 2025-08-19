
module Square
  module Merchants
    module CustomAttributeDefinitions
      class Client
        # @return [Square::Merchants::CustomAttributeDefinitions::Client]
        def initialize(client:)
          @client = client
        end

        # Lists the merchant-related [custom attribute definitions](entity:CustomAttributeDefinition) that belong to a Square seller account.
        # When all response pages are retrieved, the results include all custom attribute definitions
        # that are visible to the requesting application, including those that are created by other
        # applications and set to `VISIBILITY_READ_ONLY` or `VISIBILITY_READ_WRITE_VALUES`.
        #
        # @return [Square::Types::ListMerchantCustomAttributeDefinitionsResponse]
        def list(request_options: {}, **params)
          _request = params
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Square::Types::ListMerchantCustomAttributeDefinitionsResponse.load(_response.body)
          else
            raise _response.body
          end
        end

        # Creates a merchant-related [custom attribute definition](entity:CustomAttributeDefinition) for a Square seller account.
        # Use this endpoint to define a custom attribute that can be associated with a merchant connecting to your application.
        # A custom attribute definition specifies the `key`, `visibility`, `schema`, and other properties
        # for a custom attribute. After the definition is created, you can call
        # [UpsertMerchantCustomAttribute](api-endpoint:MerchantCustomAttributes-UpsertMerchantCustomAttribute) or
        # [BulkUpsertMerchantCustomAttributes](api-endpoint:MerchantCustomAttributes-BulkUpsertMerchantCustomAttributes)
        # to set the custom attribute for a merchant.
        #
        # @return [Square::Types::CreateMerchantCustomAttributeDefinitionResponse]
        def create(request_options: {}, **params)
          _request = params
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Square::Types::CreateMerchantCustomAttributeDefinitionResponse.load(_response.body)
          else
            raise _response.body
          end
        end

        # Retrieves a merchant-related [custom attribute definition](entity:CustomAttributeDefinition) from a Square seller account.
        # To retrieve a custom attribute definition created by another application, the `visibility`
        # setting must be `VISIBILITY_READ_ONLY` or `VISIBILITY_READ_WRITE_VALUES`.
        #
        # @return [Square::Types::RetrieveMerchantCustomAttributeDefinitionResponse]
        def get(request_options: {}, **params)
          _request = params
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Square::Types::RetrieveMerchantCustomAttributeDefinitionResponse.load(_response.body)
          else
            raise _response.body
          end
        end

        # Updates a merchant-related [custom attribute definition](entity:CustomAttributeDefinition) for a Square seller account.
        # Use this endpoint to update the following fields: `name`, `description`, `visibility`, or the
        # `schema` for a `Selection` data type.
        # Only the definition owner can update a custom attribute definition.
        #
        # @return [Square::Types::UpdateMerchantCustomAttributeDefinitionResponse]
        def update(request_options: {}, **params)
          _request = params
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Square::Types::UpdateMerchantCustomAttributeDefinitionResponse.load(_response.body)
          else
            raise _response.body
          end
        end

        # Deletes a merchant-related [custom attribute definition](entity:CustomAttributeDefinition) from a Square seller account.
        # Deleting a custom attribute definition also deletes the corresponding custom attribute from
        # the merchant.
        # Only the definition owner can delete a custom attribute definition.
        #
        # @return [Square::Types::DeleteMerchantCustomAttributeDefinitionResponse]
        def delete(request_options: {}, **params)
          _request = params
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Square::Types::DeleteMerchantCustomAttributeDefinitionResponse.load(_response.body)
          else
            raise _response.body
          end
        end

      end
    end
  end
end
