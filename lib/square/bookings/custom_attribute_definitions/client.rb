
module Square
  module Bookings
    module CustomAttributeDefinitions
      class Client
        # @option client [Square::Internal::Http::RawClient]
        #
        # @return [Square::Bookings::CustomAttributeDefinitions::Client]
        def initialize(client)
          @client = client
        end

        # Get all bookings custom attribute definitions.
        # 
        # To call this endpoint with buyer-level permissions, set `APPOINTMENTS_READ` for the OAuth scope.
        # To call this endpoint with seller-level permissions, set `APPOINTMENTS_ALL_READ` and `APPOINTMENTS_READ` for the OAuth scope.
        #
        # @return [Square::ListBookingCustomAttributeDefinitionsResponse]
        def list(request_options: {}, **params)
          _request = params
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Square::Types::ListBookingCustomAttributeDefinitionsResponse.load(_response.body)
          else
            raise _response.body
          end
        end

        # Creates a bookings custom attribute definition.
        # 
        # To call this endpoint with buyer-level permissions, set `APPOINTMENTS_WRITE` for the OAuth scope.
        # To call this endpoint with seller-level permissions, set `APPOINTMENTS_ALL_WRITE` and `APPOINTMENTS_WRITE` for the OAuth scope.
        # 
        # For calls to this endpoint with seller-level permissions to succeed, the seller must have subscribed to *Appointments Plus*
        # or *Appointments Premium*.
        #
        # @return [Square::CreateBookingCustomAttributeDefinitionResponse]
        def create(request_options: {}, **params)
          _request = params
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Square::Types::CreateBookingCustomAttributeDefinitionResponse.load(_response.body)
          else
            raise _response.body
          end
        end

        # Retrieves a bookings custom attribute definition.
        # 
        # To call this endpoint with buyer-level permissions, set `APPOINTMENTS_READ` for the OAuth scope.
        # To call this endpoint with seller-level permissions, set `APPOINTMENTS_ALL_READ` and `APPOINTMENTS_READ` for the OAuth scope.
        #
        # @return [Square::RetrieveBookingCustomAttributeDefinitionResponse]
        def get(request_options: {}, **params)
          _request = params
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Square::Types::RetrieveBookingCustomAttributeDefinitionResponse.load(_response.body)
          else
            raise _response.body
          end
        end

        # Updates a bookings custom attribute definition.
        # 
        # To call this endpoint with buyer-level permissions, set `APPOINTMENTS_WRITE` for the OAuth scope.
        # To call this endpoint with seller-level permissions, set `APPOINTMENTS_ALL_WRITE` and `APPOINTMENTS_WRITE` for the OAuth scope.
        # 
        # For calls to this endpoint with seller-level permissions to succeed, the seller must have subscribed to *Appointments Plus*
        # or *Appointments Premium*.
        #
        # @return [Square::UpdateBookingCustomAttributeDefinitionResponse]
        def update(request_options: {}, **params)
          _request = params
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Square::Types::UpdateBookingCustomAttributeDefinitionResponse.load(_response.body)
          else
            raise _response.body
          end
        end

        # Deletes a bookings custom attribute definition.
        # 
        # To call this endpoint with buyer-level permissions, set `APPOINTMENTS_WRITE` for the OAuth scope.
        # To call this endpoint with seller-level permissions, set `APPOINTMENTS_ALL_WRITE` and `APPOINTMENTS_WRITE` for the OAuth scope.
        # 
        # For calls to this endpoint with seller-level permissions to succeed, the seller must have subscribed to *Appointments Plus*
        # or *Appointments Premium*.
        #
        # @return [Square::DeleteBookingCustomAttributeDefinitionResponse]
        def delete(request_options: {}, **params)
          _request = params
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Square::Types::DeleteBookingCustomAttributeDefinitionResponse.load(_response.body)
          else
            raise _response.body
          end
        end

      end
    end
  end
end
