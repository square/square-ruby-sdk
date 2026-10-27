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
        # Returns a `Square::Internal::CursorItemIterator` that yields each `Square::Types::CustomAttributeDefinition`
        # in the `custom_attribute_definitions` field of every page, requesting pages as they are needed. Call `pages`
        # on it to get each page as a `Square::Types::ListBookingCustomAttributeDefinitionsResponse`, including its
        # other fields.
        #
        # No request is sent by this call. The first page is requested when you start iterating (or call
        # `load_first_page`), so an API error is raised by the loop (or by `load_first_page`), not by this call.
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
        # @example
        #   client.bookings.custom_attribute_definitions.list(
        #     limit: 1,
        #     cursor: "cursor"
        #   )
        #
        # @return [Square::Internal::CursorItemIterator]
        def list(request_options: {}, **params)
          params = Square::Internal::Types::Utils.normalize_keys(params)
          query_params = {}
          query_params["limit"] = params[:limit] if params.key?(:limit)
          query_params["cursor"] = params[:cursor] if params.key?(:cursor)

          Square::Internal::CursorItemIterator.new(
            cursor_field: :cursor,
            item_field: :custom_attribute_definitions,
            initial_cursor: query_params["cursor"]
          ) do |next_cursor|
            query_params["cursor"] = next_cursor
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
              parsed_response = (response.body.to_s.empty? ? nil : Square::Types::ListBookingCustomAttributeDefinitionsResponse.load(response.body))
              [parsed_response, response]
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
        # @example
        #   client.bookings.custom_attribute_definitions.create(custom_attribute_definition: {})
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
            (response.body.to_s.empty? ? nil : Square::Types::CreateBookingCustomAttributeDefinitionResponse.load(response.body))
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
        # @example
        #   client.bookings.custom_attribute_definitions.get(
        #     key: "key",
        #     version: 1
        #   )
        #
        # @return [Square::Types::RetrieveBookingCustomAttributeDefinitionResponse]
        def get(request_options: {}, **params)
          params = Square::Internal::Types::Utils.normalize_keys(params)
          query_params = {}
          query_params["version"] = params[:version] if params.key?(:version)

          request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "GET",
            path: "v2/bookings/custom-attribute-definitions/#{URI.encode_uri_component(params[:key].to_s)}",
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
            (response.body.to_s.empty? ? nil : Square::Types::RetrieveBookingCustomAttributeDefinitionResponse.load(response.body))
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
        # @example
        #   client.bookings.custom_attribute_definitions.update(
        #     key: "key",
        #     custom_attribute_definition: {}
        #   )
        #
        # @return [Square::Types::UpdateBookingCustomAttributeDefinitionResponse]
        def update(request_options: {}, **params)
          params = Square::Internal::Types::Utils.normalize_keys(params)
          request_data = Square::Bookings::CustomAttributeDefinitions::Types::UpdateBookingCustomAttributeDefinitionRequest.new(params).to_h
          non_body_param_names = %w[key]
          body = request_data.except(*non_body_param_names)

          request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "PUT",
            path: "v2/bookings/custom-attribute-definitions/#{URI.encode_uri_component(params[:key].to_s)}",
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
            (response.body.to_s.empty? ? nil : Square::Types::UpdateBookingCustomAttributeDefinitionResponse.load(response.body))
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
        # @example
        #   client.bookings.custom_attribute_definitions.delete(key: "key")
        #
        # @return [Square::Types::DeleteBookingCustomAttributeDefinitionResponse]
        def delete(request_options: {}, **params)
          params = Square::Internal::Types::Utils.normalize_keys(params)
          request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "DELETE",
            path: "v2/bookings/custom-attribute-definitions/#{URI.encode_uri_component(params[:key].to_s)}",
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Square::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            (response.body.to_s.empty? ? nil : Square::Types::DeleteBookingCustomAttributeDefinitionResponse.load(response.body))
          else
            error_class = Square::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end
      end
    end
  end
end
