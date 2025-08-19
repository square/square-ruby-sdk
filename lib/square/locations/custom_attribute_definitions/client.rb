
module Square
  module Locations
    module CustomAttributeDefinitions
      class Client
        # @return [Square::Locations::CustomAttributeDefinitions::Client]
        def initialize(client:)
          @client = client
        end

        # Lists the location-related [custom attribute definitions](entity:CustomAttributeDefinition) that belong to a Square seller account.
        # When all response pages are retrieved, the results include all custom attribute definitions
        # that are visible to the requesting application, including those that are created by other
        # applications and set to `VISIBILITY_READ_ONLY` or `VISIBILITY_READ_WRITE_VALUES`.
        #
        # @return [Square::Types::ListLocationCustomAttributeDefinitionsResponse]
        def list(request_options: {}, **params)
          _request = params
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Square::Types::ListLocationCustomAttributeDefinitionsResponse.load(_response.body)
          else
            raise _response.body
          end
        end

        # Creates a location-related [custom attribute definition](entity:CustomAttributeDefinition) for a Square seller account.
        # Use this endpoint to define a custom attribute that can be associated with locations.
        # A custom attribute definition specifies the `key`, `visibility`, `schema`, and other properties
        # for a custom attribute. After the definition is created, you can call
        # [UpsertLocationCustomAttribute](api-endpoint:LocationCustomAttributes-UpsertLocationCustomAttribute) or
        # [BulkUpsertLocationCustomAttributes](api-endpoint:LocationCustomAttributes-BulkUpsertLocationCustomAttributes)
        # to set the custom attribute for locations.
        #
        # @return [Square::Types::CreateLocationCustomAttributeDefinitionResponse]
        def create(request_options: {}, **params)
          _request = params
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Square::Types::CreateLocationCustomAttributeDefinitionResponse.load(_response.body)
          else
            raise _response.body
          end
        end

        # Retrieves a location-related [custom attribute definition](entity:CustomAttributeDefinition) from a Square seller account.
        # To retrieve a custom attribute definition created by another application, the `visibility`
        # setting must be `VISIBILITY_READ_ONLY` or `VISIBILITY_READ_WRITE_VALUES`.
        #
        # @return [Square::Types::RetrieveLocationCustomAttributeDefinitionResponse]
        def get(request_options: {}, **params)
          _request = params
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Square::Types::RetrieveLocationCustomAttributeDefinitionResponse.load(_response.body)
          else
            raise _response.body
          end
        end

        # Updates a location-related [custom attribute definition](entity:CustomAttributeDefinition) for a Square seller account.
        # Use this endpoint to update the following fields: `name`, `description`, `visibility`, or the
        # `schema` for a `Selection` data type.
        # Only the definition owner can update a custom attribute definition.
        #
        # @return [Square::Types::UpdateLocationCustomAttributeDefinitionResponse]
        def update(request_options: {}, **params)
          _request = params
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Square::Types::UpdateLocationCustomAttributeDefinitionResponse.load(_response.body)
          else
            raise _response.body
          end
        end

        # Deletes a location-related [custom attribute definition](entity:CustomAttributeDefinition) from a Square seller account.
        # Deleting a custom attribute definition also deletes the corresponding custom attribute from
        # all locations.
        # Only the definition owner can delete a custom attribute definition.
        #
        # @return [Square::Types::DeleteLocationCustomAttributeDefinitionResponse]
        def delete(request_options: {}, **params)
          _request = params
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Square::Types::DeleteLocationCustomAttributeDefinitionResponse.load(_response.body)
          else
            raise _response.body
          end
        end

      end
    end
  end
end
