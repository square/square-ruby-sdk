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
            base_url: request_options[:base_url] || Square::Environment::PRODUCTION,
            method: "POST",
            path: "v2/bookings/custom-attributes/bulk-delete",
            body: params
          )
          begin
            _response = @client.send(_request)
          rescue Net::HTTPRequestTimeout
            raise Square::Errors::TimeoutError
          end
          code = _response.code.to_i
          if code.between?(200, 299)
            Square::Types::BulkDeleteBookingCustomAttributesResponse.load(_response.body)
          else
            error_class = Square::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(_response.body, code: code)
          end
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
            base_url: request_options[:base_url] || Square::Environment::PRODUCTION,
            method: "POST",
            path: "v2/bookings/custom-attributes/bulk-upsert",
            body: params
          )
          begin
            _response = @client.send(_request)
          rescue Net::HTTPRequestTimeout
            raise Square::Errors::TimeoutError
          end
          code = _response.code.to_i
          if code.between?(200, 299)
            Square::Types::BulkUpsertBookingCustomAttributesResponse.load(_response.body)
          else
            error_class = Square::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(_response.body, code: code)
          end
        end

        # Lists a booking's custom attributes.
        #
        # To call this endpoint with buyer-level permissions, set `APPOINTMENTS_READ` for the OAuth scope.
        # To call this endpoint with seller-level permissions, set `APPOINTMENTS_ALL_READ` and `APPOINTMENTS_READ` for the OAuth scope.
        #
        # @return [Square::Types::ListBookingCustomAttributesResponse]
        def list(request_options: {}, **params)
          params = Square::Internal::Types::Utils.symbolize_keys(params)
          _query_param_names = %i[limit cursor with_definitions]
          _query = params.slice(*_query_param_names)
          params = params.except(*_query_param_names)

          Square::Internal::CursorItemIterator.new(
            cursor_field: :cursor,
            item_field: :custom_attributes,
            initial_cursor: _query[:cursor]
          ) do |next_cursor|
            _query[:cursor] = next_cursor
            _request = Square::Internal::JSON::Request.new(
              base_url: request_options[:base_url] || Square::Environment::PRODUCTION,
              method: "GET",
              path: "v2/bookings/#{params[:booking_id]}/custom-attributes",
              query: _query
            )
            begin
              _response = @client.send(_request)
            rescue Net::HTTPRequestTimeout
              raise Square::Errors::TimeoutError
            end
            code = _response.code.to_i
            if code.between?(200, 299)
              Square::Types::ListBookingCustomAttributesResponse.load(_response.body)
            else
              error_class = Square::Errors::ResponseError.subclass_for_code(code)
              raise error_class.new(_response.body, code: code)
            end
          end
        end

        # Retrieves a bookings custom attribute.
        #
        # To call this endpoint with buyer-level permissions, set `APPOINTMENTS_READ` for the OAuth scope.
        # To call this endpoint with seller-level permissions, set `APPOINTMENTS_ALL_READ` and `APPOINTMENTS_READ` for the OAuth scope.
        #
        # @return [Square::Types::RetrieveBookingCustomAttributeResponse]
        def get(request_options: {}, **params)
          params = Square::Internal::Types::Utils.symbolize_keys(params)
          _query_param_names = %i[with_definition version]
          _query = params.slice(*_query_param_names)
          params = params.except(*_query_param_names)

          _request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Square::Environment::PRODUCTION,
            method: "GET",
            path: "v2/bookings/#{params[:booking_id]}/custom-attributes/#{params[:key]}",
            query: _query
          )
          begin
            _response = @client.send(_request)
          rescue Net::HTTPRequestTimeout
            raise Square::Errors::TimeoutError
          end
          code = _response.code.to_i
          if code.between?(200, 299)
            Square::Types::RetrieveBookingCustomAttributeResponse.load(_response.body)
          else
            error_class = Square::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(_response.body, code: code)
          end
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
            base_url: request_options[:base_url] || Square::Environment::PRODUCTION,
            method: "PUT",
            path: "v2/bookings/#{params[:booking_id]}/custom-attributes/#{params[:key]}",
            body: params.except(*_path_param_names)
          )
          begin
            _response = @client.send(_request)
          rescue Net::HTTPRequestTimeout
            raise Square::Errors::TimeoutError
          end
          code = _response.code.to_i
          if code.between?(200, 299)
            Square::Types::UpsertBookingCustomAttributeResponse.load(_response.body)
          else
            error_class = Square::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(_response.body, code: code)
          end
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
            base_url: request_options[:base_url] || Square::Environment::PRODUCTION,
            method: "DELETE",
            path: "v2/bookings/#{params[:booking_id]}/custom-attributes/#{params[:key]}"
          )
          begin
            _response = @client.send(_request)
          rescue Net::HTTPRequestTimeout
            raise Square::Errors::TimeoutError
          end
          code = _response.code.to_i
          if code.between?(200, 299)
            Square::Types::DeleteBookingCustomAttributeResponse.load(_response.body)
          else
            error_class = Square::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(_response.body, code: code)
          end
        end
      end
    end
  end
end
