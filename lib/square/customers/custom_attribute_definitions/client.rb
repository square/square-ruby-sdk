
module Square
  module Customers
    module CustomAttributeDefinitions
      class Client
        # @option client [Square::Internal::Http::RawClient]
        #
        # @return [Square::Customers::CustomAttributeDefinitions::Client]
        def initialize(client)
          @client = client
        end

        # Lists the customer-related [custom attribute definitions](entity:CustomAttributeDefinition) that belong to a Square seller account.
        # 
        # When all response pages are retrieved, the results include all custom attribute definitions
        # that are visible to the requesting application, including those that are created by other
        # applications and set to `VISIBILITY_READ_ONLY` or `VISIBILITY_READ_WRITE_VALUES`. Note that
        # seller-defined custom attributes (also known as custom fields) are always set to `VISIBILITY_READ_WRITE_VALUES`.
        #
        # @return [Square::Types::ListCustomerCustomAttributeDefinitionsResponse]
        def list(request_options: {}, **params)
          _request = params
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Square::Types::ListCustomerCustomAttributeDefinitionsResponse.load(_response.body)
          else
            raise _response.body
          end
        end

        # Creates a customer-related [custom attribute definition](entity:CustomAttributeDefinition) for a Square seller account.
        # Use this endpoint to define a custom attribute that can be associated with customer profiles.
        # 
        # A custom attribute definition specifies the `key`, `visibility`, `schema`, and other properties
        # for a custom attribute. After the definition is created, you can call
        # [UpsertCustomerCustomAttribute](api-endpoint:CustomerCustomAttributes-UpsertCustomerCustomAttribute) or
        # [BulkUpsertCustomerCustomAttributes](api-endpoint:CustomerCustomAttributes-BulkUpsertCustomerCustomAttributes)
        # to set the custom attribute for customer profiles in the seller's Customer Directory.
        # 
        # Sellers can view all custom attributes in exported customer data, including those set to
        # `VISIBILITY_HIDDEN`.
        #
        # @return [Square::Types::CreateCustomerCustomAttributeDefinitionResponse]
        def create(request_options: {}, **params)
          _request = params
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Square::Types::CreateCustomerCustomAttributeDefinitionResponse.load(_response.body)
          else
            raise _response.body
          end
        end

        # Retrieves a customer-related [custom attribute definition](entity:CustomAttributeDefinition) from a Square seller account.
        # 
        # To retrieve a custom attribute definition created by another application, the `visibility`
        # setting must be `VISIBILITY_READ_ONLY` or `VISIBILITY_READ_WRITE_VALUES`. Note that seller-defined custom attributes
        # (also known as custom fields) are always set to `VISIBILITY_READ_WRITE_VALUES`.
        #
        # @return [Square::Types::GetCustomerCustomAttributeDefinitionResponse]
        def get(request_options: {}, **params)
          _request = params
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Square::Types::GetCustomerCustomAttributeDefinitionResponse.load(_response.body)
          else
            raise _response.body
          end
        end

        # Updates a customer-related [custom attribute definition](entity:CustomAttributeDefinition) for a Square seller account.
        # 
        # Use this endpoint to update the following fields: `name`, `description`, `visibility`, or the
        # `schema` for a `Selection` data type.
        # 
        # Only the definition owner can update a custom attribute definition. Note that sellers can view
        # all custom attributes in exported customer data, including those set to `VISIBILITY_HIDDEN`.
        #
        # @return [Square::Types::UpdateCustomerCustomAttributeDefinitionResponse]
        def update(request_options: {}, **params)
          _request = params
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Square::Types::UpdateCustomerCustomAttributeDefinitionResponse.load(_response.body)
          else
            raise _response.body
          end
        end

        # Deletes a customer-related [custom attribute definition](entity:CustomAttributeDefinition) from a Square seller account.
        # 
        # Deleting a custom attribute definition also deletes the corresponding custom attribute from
        # all customer profiles in the seller's Customer Directory.
        # 
        # Only the definition owner can delete a custom attribute definition.
        #
        # @return [Square::Types::DeleteCustomerCustomAttributeDefinitionResponse]
        def delete(request_options: {}, **params)
          _request = params
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Square::Types::DeleteCustomerCustomAttributeDefinitionResponse.load(_response.body)
          else
            raise _response.body
          end
        end

        # Creates or updates [custom attributes](entity:CustomAttribute) for customer profiles as a bulk operation.
        # 
        # Use this endpoint to set the value of one or more custom attributes for one or more customer profiles.
        # A custom attribute is based on a custom attribute definition in a Square seller account, which is
        # created using the [CreateCustomerCustomAttributeDefinition](api-endpoint:CustomerCustomAttributes-CreateCustomerCustomAttributeDefinition) endpoint.
        # 
        # This `BulkUpsertCustomerCustomAttributes` endpoint accepts a map of 1 to 25 individual upsert
        # requests and returns a map of individual upsert responses. Each upsert request has a unique ID
        # and provides a customer ID and custom attribute. Each upsert response is returned with the ID
        # of the corresponding request.
        # 
        # To create or update a custom attribute owned by another application, the `visibility` setting
        # must be `VISIBILITY_READ_WRITE_VALUES`. Note that seller-defined custom attributes
        # (also known as custom fields) are always set to `VISIBILITY_READ_WRITE_VALUES`.
        #
        # @return [Square::Types::BatchUpsertCustomerCustomAttributesResponse]
        def batch_upsert(request_options: {}, **params)
          _request = params
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Square::Types::BatchUpsertCustomerCustomAttributesResponse.load(_response.body)
          else
            raise _response.body
          end
        end

      end
    end
  end
end
