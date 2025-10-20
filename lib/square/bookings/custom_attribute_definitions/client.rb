# frozen_string_literal: true

module Square
  module Bookings
    module CustomAttributeDefinitions
      class Client
        # @return [Square::Bookings::CustomAttributeDefinitions::Client]
        def initialize(client:)
          @client = client
        end

        # Get all bookings custom attribute definitions.
        #
        # To call this endpoint with buyer-level permissions, set `APPOINTMENTS_READ` for the OAuth scope.
        # To call this endpoint with seller-level permissions, set `APPOINTMENTS_ALL_READ` and `APPOINTMENTS_READ` for the OAuth scope.
        #
        # @return [Square::Types::ListBookingCustomAttributeDefinitionsResponse]
        def list(request_options: {}, **params)
          params = Square::Internal::Types::Utils.symbolize_keys(params)
          _query_param_names = %i[limit cursor]
          _query = params.slice(*_query_param_names)
          params.except(*_query_param_names)

          Square::Internal::CursorItemIterator.new(
            cursor_field: :cursor,
            item_field: :custom_attribute_definitions,
            initial_cursor: _query[:cursor]
          ) do |next_cursor|
            _query[:cursor] = next_cursor
            _request = Square::Internal::JSON::Request.new(
              base_url: request_options[:base_url] || Square::Environment::PRODUCTION,
              method: "GET",
              path: "v2/bookings/custom-attribute-definitions",
              query: _query
            )
            begin
              _response = @client.send(_request)
            rescue Net::HTTPRequestTimeout
              raise Square::Errors::TimeoutError
            end
            code = _response.code.to_i
            if code.between?(200, 299)
              Square::Types::ListBookingCustomAttributeDefinitionsResponse.load(_response.body)
            else
              error_class = Square::Errors::ResponseError.subclass_for_code(code)
              raise error_class.new(_response.body, code: code)
            end
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
        # @return [Square::Types::CreateBookingCustomAttributeDefinitionResponse]
        def create(request_options: {}, **params)
          _request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Square::Environment::PRODUCTION,
            method: "POST",
            path: "v2/bookings/custom-attribute-definitions",
            body: params
          )
          begin
            _response = @client.send(_request)
          rescue Net::HTTPRequestTimeout
            raise Square::Errors::TimeoutError
          end
          code = _response.code.to_i
          if code.between?(200, 299)
            Square::Types::CreateBookingCustomAttributeDefinitionResponse.load(_response.body)
          else
            error_class = Square::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(_response.body, code: code)
          end
        end

        # Retrieves a bookings custom attribute definition.
        #
        # To call this endpoint with buyer-level permissions, set `APPOINTMENTS_READ` for the OAuth scope.
        # To call this endpoint with seller-level permissions, set `APPOINTMENTS_ALL_READ` and `APPOINTMENTS_READ` for the OAuth scope.
        #
        # @return [Square::Types::RetrieveBookingCustomAttributeDefinitionResponse]
        def get(request_options: {}, **params)
          params = Square::Internal::Types::Utils.symbolize_keys(params)
          _query_param_names = %i[version]
          _query = params.slice(*_query_param_names)
          params = params.except(*_query_param_names)

          _request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Square::Environment::PRODUCTION,
            method: "GET",
            path: "v2/bookings/custom-attribute-definitions/#{params[:key]}",
            query: _query
          )
          begin
            _response = @client.send(_request)
          rescue Net::HTTPRequestTimeout
            raise Square::Errors::TimeoutError
          end
          code = _response.code.to_i
          if code.between?(200, 299)
            Square::Types::RetrieveBookingCustomAttributeDefinitionResponse.load(_response.body)
          else
            error_class = Square::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(_response.body, code: code)
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
        # @return [Square::Types::UpdateBookingCustomAttributeDefinitionResponse]
        def update(request_options: {}, **params)
          _path_param_names = ["key"]

          _request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Square::Environment::PRODUCTION,
            method: "PUT",
            path: "v2/bookings/custom-attribute-definitions/#{params[:key]}",
            body: params.except(*_path_param_names)
          )
          begin
            _response = @client.send(_request)
          rescue Net::HTTPRequestTimeout
            raise Square::Errors::TimeoutError
          end
          code = _response.code.to_i
          if code.between?(200, 299)
            Square::Types::UpdateBookingCustomAttributeDefinitionResponse.load(_response.body)
          else
            error_class = Square::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(_response.body, code: code)
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
        # @return [Square::Types::DeleteBookingCustomAttributeDefinitionResponse]
        def delete(request_options: {}, **params)
          _request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Square::Environment::PRODUCTION,
            method: "DELETE",
            path: "v2/bookings/custom-attribute-definitions/#{params[:key]}"
          )
          begin
            _response = @client.send(_request)
          rescue Net::HTTPRequestTimeout
            raise Square::Errors::TimeoutError
          end
          code = _response.code.to_i
          if code.between?(200, 299)
            Square::Types::DeleteBookingCustomAttributeDefinitionResponse.load(_response.body)
          else
            error_class = Square::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(_response.body, code: code)
          end
        end
      end
    end
  end
end
