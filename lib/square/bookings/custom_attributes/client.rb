# frozen_string_literal: true

module Square
  module Bookings
    module CustomAttributes
      class Client
        # @return [Square::Bookings::CustomAttributes::Client]
        def initialize(client:)
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
        # @return [Square::Types::BulkDeleteBookingCustomAttributesResponse]
        def batch_delete(request_options: {}, **params)
          _request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Square::Environment::SANDBOX,
            method: "POST",
            path: "v2/bookings/custom-attributes/bulk-delete",
            body: params
          )
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Square::Types::BulkDeleteBookingCustomAttributesResponse.load(_response.body)
          end

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
        # @return [Square::Types::BulkUpsertBookingCustomAttributesResponse]
        def batch_upsert(request_options: {}, **params)
          _request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Square::Environment::SANDBOX,
            method: "POST",
            path: "v2/bookings/custom-attributes/bulk-upsert",
            body: params
          )
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Square::Types::BulkUpsertBookingCustomAttributesResponse.load(_response.body)
          end

          raise _response.body
        end

        # Lists a booking's custom attributes.
        #
        # To call this endpoint with buyer-level permissions, set `APPOINTMENTS_READ` for the OAuth scope.
        # To call this endpoint with seller-level permissions, set `APPOINTMENTS_ALL_READ` and `APPOINTMENTS_READ` for the OAuth scope.
        #
        # @return [Square::Types::ListBookingCustomAttributesResponse]
        def list(request_options: {}, **params)
          _query_param_names = %w[limit cursor with_definitions]
          _query = params.slice(*_query_param_names)
          params = params.except(*_query_param_names)

          _request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Square::Environment::SANDBOX,
            method: "GET",
            path: "v2/bookings/#{params[:booking_id]}/custom-attributes",
            query: _query
          )
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Square::Types::ListBookingCustomAttributesResponse.load(_response.body)
          end

          raise _response.body
        end

        # Retrieves a bookings custom attribute.
        #
        # To call this endpoint with buyer-level permissions, set `APPOINTMENTS_READ` for the OAuth scope.
        # To call this endpoint with seller-level permissions, set `APPOINTMENTS_ALL_READ` and `APPOINTMENTS_READ` for the OAuth scope.
        #
        # @return [Square::Types::RetrieveBookingCustomAttributeResponse]
        def get(request_options: {}, **params)
          _query_param_names = %w[with_definition version]
          _query = params.slice(*_query_param_names)
          params = params.except(*_query_param_names)

          _request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Square::Environment::SANDBOX,
            method: "GET",
            path: "v2/bookings/#{params[:booking_id]}/custom-attributes/#{params[:key]}",
            query: _query
          )
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Square::Types::RetrieveBookingCustomAttributeResponse.load(_response.body)
          end

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
        # @return [Square::Types::UpsertBookingCustomAttributeResponse]
        def upsert(request_options: {}, **params)
          _path_param_names = %w[booking_id key]

          _request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Square::Environment::SANDBOX,
            method: "PUT",
            path: "v2/bookings/#{params[:booking_id]}/custom-attributes/#{params[:key]}",
            body: params.except(*_path_param_names)
          )
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Square::Types::UpsertBookingCustomAttributeResponse.load(_response.body)
          end

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
        # @return [Square::Types::DeleteBookingCustomAttributeResponse]
        def delete(request_options: {}, **params)
          _request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Square::Environment::SANDBOX,
            method: "DELETE",
            path: "v2/bookings/#{params[:booking_id]}/custom-attributes/#{params[:key]}"
          )
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Square::Types::DeleteBookingCustomAttributeResponse.load(_response.body)
          end

          raise _response.body
        end
      end
    end
  end
end
