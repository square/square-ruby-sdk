
module Square
  module Bookings
    module CustomAttributes
      class Client
        # @option client [Square::Internal::Http::RawClient]
        #
        # @return [Square::Bookings::CustomAttributes::Client]
        def initialize(client)
          @client = client
        end

        # Bulk deletes bookings custom attributes.
        # 
        # To call this endpoint with buyer-level permissions, set `APPOINTMENTS_WRITE` for the OAuth scope.
        # To call this endpoint with seller-level permissions, set `APPOINTMENTS_ALL_WRITE` and `APPOINTMENTS_WRITE` for the OAuth scope.
        # 
        # For calls to this endpoint with seller-level permissions to succeed, the seller must have subscribed to *Appointments Plus*
        # or *Appointments Premium*.
        #
        # @return [Square::BulkDeleteBookingCustomAttributesResponse]
        def batch_delete(request_options: {}, **params)
          _request = params

          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Square::Types::BulkDeleteBookingCustomAttributesResponse.load(_response.body)

          else
            raise _response.body
        end

        # Bulk upserts bookings custom attributes.
        # 
        # To call this endpoint with buyer-level permissions, set `APPOINTMENTS_WRITE` for the OAuth scope.
        # To call this endpoint with seller-level permissions, set `APPOINTMENTS_ALL_WRITE` and `APPOINTMENTS_WRITE` for the OAuth scope.
        # 
        # For calls to this endpoint with seller-level permissions to succeed, the seller must have subscribed to *Appointments Plus*
        # or *Appointments Premium*.
        #
        # @return [Square::BulkUpsertBookingCustomAttributesResponse]
        def batch_upsert(request_options: {}, **params)
          _request = params

          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Square::Types::BulkUpsertBookingCustomAttributesResponse.load(_response.body)

          else
            raise _response.body
        end

        # Lists a booking's custom attributes.
        # 
        # To call this endpoint with buyer-level permissions, set `APPOINTMENTS_READ` for the OAuth scope.
        # To call this endpoint with seller-level permissions, set `APPOINTMENTS_ALL_READ` and `APPOINTMENTS_READ` for the OAuth scope.
        #
        # @return [Square::ListBookingCustomAttributesResponse]
        def list(request_options: {}, **params)
          _request = params

          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Square::Types::ListBookingCustomAttributesResponse.load(_response.body)

          else
            raise _response.body
        end

        # Retrieves a bookings custom attribute.
        # 
        # To call this endpoint with buyer-level permissions, set `APPOINTMENTS_READ` for the OAuth scope.
        # To call this endpoint with seller-level permissions, set `APPOINTMENTS_ALL_READ` and `APPOINTMENTS_READ` for the OAuth scope.
        #
        # @return [Square::RetrieveBookingCustomAttributeResponse]
        def get(request_options: {}, **params)
          _request = params

          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Square::Types::RetrieveBookingCustomAttributeResponse.load(_response.body)

          else
            raise _response.body
        end

        # Upserts a bookings custom attribute.
        # 
        # To call this endpoint with buyer-level permissions, set `APPOINTMENTS_WRITE` for the OAuth scope.
        # To call this endpoint with seller-level permissions, set `APPOINTMENTS_ALL_WRITE` and `APPOINTMENTS_WRITE` for the OAuth scope.
        # 
        # For calls to this endpoint with seller-level permissions to succeed, the seller must have subscribed to *Appointments Plus*
        # or *Appointments Premium*.
        #
        # @return [Square::UpsertBookingCustomAttributeResponse]
        def upsert(request_options: {}, **params)
          _request = params

          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Square::Types::UpsertBookingCustomAttributeResponse.load(_response.body)

          else
            raise _response.body
        end

        # Deletes a bookings custom attribute.
        # 
        # To call this endpoint with buyer-level permissions, set `APPOINTMENTS_WRITE` for the OAuth scope.
        # To call this endpoint with seller-level permissions, set `APPOINTMENTS_ALL_WRITE` and `APPOINTMENTS_WRITE` for the OAuth scope.
        # 
        # For calls to this endpoint with seller-level permissions to succeed, the seller must have subscribed to *Appointments Plus*
        # or *Appointments Premium*.
        #
        # @return [Square::DeleteBookingCustomAttributeResponse]
        def delete(request_options: {}, **params)
          _request = params

          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Square::Types::DeleteBookingCustomAttributeResponse.load(_response.body)

          else
            raise _response.body
        end

      end
    end
  end
end
