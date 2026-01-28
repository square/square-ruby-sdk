# frozen_string_literal: true

module Square
  module Bookings
    module CustomAttributeDefinitions
      class Client
        # @param client [Square::Internal::Http::RawClient]
        #
        # @return [void]
        def initialize(client:)
          @client = client
        end

        # Get all bookings custom attribute definitions.
        #
        # To call this endpoint with buyer-level permissions, set `APPOINTMENTS_READ` for the OAuth scope.
        # To call this endpoint with seller-level permissions, set `APPOINTMENTS_ALL_READ` and `APPOINTMENTS_READ` for
        # the OAuth scope.
        #
        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [Integer, nil] :limit
        # @option params [String, nil] :cursor
        #
        # @return [Square::Types::ListBookingCustomAttributeDefinitionsResponse]
        def list(request_options: {}, **params)
          params = Square::Internal::Types::Utils.normalize_keys(params)
          query_param_names = %i[limit cursor]
          query_params = {}
          query_params["limit"] = params[:limit] if params.key?(:limit)
          query_params["cursor"] = params[:cursor] if params.key?(:cursor)
          params.except(*query_param_names)

          Square::Internal::CursorItemIterator.new(
            cursor_field: :cursor,
            item_field: :custom_attribute_definitions,
            initial_cursor: query_params[:cursor]
          ) do |next_cursor|
            query_params[:cursor] = next_cursor
            request = Square::Internal::JSON::Request.new(
              base_url: request_options[:base_url],
              method: "GET",
              path: "v2/bookings/custom-attribute-definitions",
              query: query_params,
              request_options: request_options
            )
            begin
              response = @client.send(request)
            rescue Net::HTTPRequestTimeout
              raise Square::Errors::TimeoutError
            end
            code = response.code.to_i
            if code.between?(200, 299)
              Square::Types::ListBookingCustomAttributeDefinitionsResponse.load(response.body)
            else
              error_class = Square::Errors::ResponseError.subclass_for_code(code)
              raise error_class.new(response.body, code: code)
            end
          end
        end

        # Creates a bookings custom attribute definition.
        #
        # To call this endpoint with buyer-level permissions, set `APPOINTMENTS_WRITE` for the OAuth scope.
        # To call this endpoint with seller-level permissions, set `APPOINTMENTS_ALL_WRITE` and `APPOINTMENTS_WRITE` for
        # the OAuth scope.
        #
        # For calls to this endpoint with seller-level permissions to succeed, the seller must have subscribed to
        # *Appointments Plus*
        # or *Appointments Premium*.
        #
        # @param request_options [Hash]
        # @param params [Square::Bookings::CustomAttributeDefinitions::Types::CreateBookingCustomAttributeDefinitionRequest]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        #
        # @return [Square::Types::CreateBookingCustomAttributeDefinitionResponse]
        def create(request_options: {}, **params)
          params = Square::Internal::Types::Utils.normalize_keys(params)
          request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "POST",
            path: "v2/bookings/custom-attribute-definitions",
            body: Square::Bookings::CustomAttributeDefinitions::Types::CreateBookingCustomAttributeDefinitionRequest.new(params).to_h,
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Square::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Square::Types::CreateBookingCustomAttributeDefinitionResponse.load(response.body)
          else
            error_class = Square::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Retrieves a bookings custom attribute definition.
        #
        # To call this endpoint with buyer-level permissions, set `APPOINTMENTS_READ` for the OAuth scope.
        # To call this endpoint with seller-level permissions, set `APPOINTMENTS_ALL_READ` and `APPOINTMENTS_READ` for
        # the OAuth scope.
        #
        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :key
        # @option params [Integer, nil] :version
        #
        # @return [Square::Types::RetrieveBookingCustomAttributeDefinitionResponse]
        def get(request_options: {}, **params)
          params = Square::Internal::Types::Utils.normalize_keys(params)
          query_param_names = %i[version]
          query_params = {}
          query_params["version"] = params[:version] if params.key?(:version)
          params = params.except(*query_param_names)

          request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "GET",
            path: "v2/bookings/custom-attribute-definitions/#{params[:key]}",
            query: query_params,
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Square::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Square::Types::RetrieveBookingCustomAttributeDefinitionResponse.load(response.body)
          else
            error_class = Square::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Updates a bookings custom attribute definition.
        #
        # To call this endpoint with buyer-level permissions, set `APPOINTMENTS_WRITE` for the OAuth scope.
        # To call this endpoint with seller-level permissions, set `APPOINTMENTS_ALL_WRITE` and `APPOINTMENTS_WRITE` for
        # the OAuth scope.
        #
        # For calls to this endpoint with seller-level permissions to succeed, the seller must have subscribed to
        # *Appointments Plus*
        # or *Appointments Premium*.
        #
        # @param request_options [Hash]
        # @param params [Square::Bookings::CustomAttributeDefinitions::Types::UpdateBookingCustomAttributeDefinitionRequest]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :key
        #
        # @return [Square::Types::UpdateBookingCustomAttributeDefinitionResponse]
        def update(request_options: {}, **params)
          params = Square::Internal::Types::Utils.normalize_keys(params)
          request_data = Square::Bookings::CustomAttributeDefinitions::Types::UpdateBookingCustomAttributeDefinitionRequest.new(params).to_h
          non_body_param_names = ["key"]
          body = request_data.except(*non_body_param_names)

          request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "PUT",
            path: "v2/bookings/custom-attribute-definitions/#{params[:key]}",
            body: body,
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Square::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Square::Types::UpdateBookingCustomAttributeDefinitionResponse.load(response.body)
          else
            error_class = Square::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Deletes a bookings custom attribute definition.
        #
        # To call this endpoint with buyer-level permissions, set `APPOINTMENTS_WRITE` for the OAuth scope.
        # To call this endpoint with seller-level permissions, set `APPOINTMENTS_ALL_WRITE` and `APPOINTMENTS_WRITE` for
        # the OAuth scope.
        #
        # For calls to this endpoint with seller-level permissions to succeed, the seller must have subscribed to
        # *Appointments Plus*
        # or *Appointments Premium*.
        #
        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :key
        #
        # @return [Square::Types::DeleteBookingCustomAttributeDefinitionResponse]
        def delete(request_options: {}, **params)
          params = Square::Internal::Types::Utils.normalize_keys(params)
          request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "DELETE",
            path: "v2/bookings/custom-attribute-definitions/#{params[:key]}",
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Square::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Square::Types::DeleteBookingCustomAttributeDefinitionResponse.load(response.body)
          else
            error_class = Square::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end
      end
    end
  end
end
