
module Square
    module Locations
        module CustomAttributes
            class Client
                # @option client [Square::Internal::Http::RawClient]
                #
                # @return [Square::Locations::CustomAttributes::Client]
                def initialize(client)
                    @client = client
                end

                # Deletes [custom attributes](entity:CustomAttribute) for locations as a bulk operation.
                # To delete a custom attribute owned by another application, the `visibility` setting must be
                # `VISIBILITY_READ_WRITE_VALUES`.
                #
                # @return [Square::BulkDeleteLocationCustomAttributesResponse]
                def batch_delete(request_options: {}, **params)
                    _request = params

                    _response = @client.send(_request)
                    if _response.code >= "200" && _response.code < "300"
                        return Square::Types::BulkDeleteLocationCustomAttributesResponse.load(_response.body)

                    else
                        raise _response.body
                end

                # Creates or updates [custom attributes](entity:CustomAttribute) for locations as a bulk operation.
                # Use this endpoint to set the value of one or more custom attributes for one or more locations.
                # A custom attribute is based on a custom attribute definition in a Square seller account, which is
                # created using the [CreateLocationCustomAttributeDefinition](api-endpoint:LocationCustomAttributes-CreateLocationCustomAttributeDefinition) endpoint.
                # This `BulkUpsertLocationCustomAttributes` endpoint accepts a map of 1 to 25 individual upsert
                # requests and returns a map of individual upsert responses. Each upsert request has a unique ID
                # and provides a location ID and custom attribute. Each upsert response is returned with the ID
                # of the corresponding request.
                # To create or update a custom attribute owned by another application, the `visibility` setting
                # must be `VISIBILITY_READ_WRITE_VALUES`.
                #
                # @return [Square::BulkUpsertLocationCustomAttributesResponse]
                def batch_upsert(request_options: {}, **params)
                    _request = params

                    _response = @client.send(_request)
                    if _response.code >= "200" && _response.code < "300"
                        return Square::Types::BulkUpsertLocationCustomAttributesResponse.load(_response.body)

                    else
                        raise _response.body
                end

                # Lists the [custom attributes](entity:CustomAttribute) associated with a location.
                # You can use the `with_definitions` query parameter to also retrieve custom attribute definitions
                # in the same call.
                # When all response pages are retrieved, the results include all custom attributes that are
                # visible to the requesting application, including those that are owned by other applications
                # and set to `VISIBILITY_READ_ONLY` or `VISIBILITY_READ_WRITE_VALUES`.
                #
                # @return [Square::ListLocationCustomAttributesResponse]
                def list(request_options: {}, **params)
                    _request = params

                    _response = @client.send(_request)
                    if _response.code >= "200" && _response.code < "300"
                        return Square::Types::ListLocationCustomAttributesResponse.load(_response.body)

                    else
                        raise _response.body
                end

                # Retrieves a [custom attribute](entity:CustomAttribute) associated with a location.
                # You can use the `with_definition` query parameter to also retrieve the custom attribute definition
                # in the same call.
                # To retrieve a custom attribute owned by another application, the `visibility` setting must be
                # `VISIBILITY_READ_ONLY` or `VISIBILITY_READ_WRITE_VALUES`.
                #
                # @return [Square::RetrieveLocationCustomAttributeResponse]
                def get(request_options: {}, **params)
                    _request = params

                    _response = @client.send(_request)
                    if _response.code >= "200" && _response.code < "300"
                        return Square::Types::RetrieveLocationCustomAttributeResponse.load(_response.body)

                    else
                        raise _response.body
                end

                # Creates or updates a [custom attribute](entity:CustomAttribute) for a location.
                # Use this endpoint to set the value of a custom attribute for a specified location.
                # A custom attribute is based on a custom attribute definition in a Square seller account, which
                # is created using the [CreateLocationCustomAttributeDefinition](api-endpoint:LocationCustomAttributes-CreateLocationCustomAttributeDefinition) endpoint.
                # To create or update a custom attribute owned by another application, the `visibility` setting
                # must be `VISIBILITY_READ_WRITE_VALUES`.
                #
                # @return [Square::UpsertLocationCustomAttributeResponse]
                def upsert(request_options: {}, **params)
                    _request = params

                    _response = @client.send(_request)
                    if _response.code >= "200" && _response.code < "300"
                        return Square::Types::UpsertLocationCustomAttributeResponse.load(_response.body)

                    else
                        raise _response.body
                end

                # Deletes a [custom attribute](entity:CustomAttribute) associated with a location.
                # To delete a custom attribute owned by another application, the `visibility` setting must be
                # `VISIBILITY_READ_WRITE_VALUES`.
                #
                # @return [Square::DeleteLocationCustomAttributeResponse]
                def delete(request_options: {}, **params)
                    _request = params

                    _response = @client.send(_request)
                    if _response.code >= "200" && _response.code < "300"
                        return Square::Types::DeleteLocationCustomAttributeResponse.load(_response.body)

                    else
                        raise _response.body
                end
            end
        end
    end
end
