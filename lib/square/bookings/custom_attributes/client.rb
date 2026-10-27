# frozen_string_literal: true

module Square
  module Bookings
    module CustomAttributes
      class Client
        # @param client [Square::Internal::Http::RawClient]
        #
        # @return [void]
        def initialize(client:)
          @client = client
        end

        # Bulk deletes bookings custom attributes.
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
        # @param params [Square::Bookings::CustomAttributes::Types::BulkDeleteBookingCustomAttributesRequest]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        #
        # @example
        #   client.bookings.custom_attributes.batch_delete(values: {
        #     key: {
        #       booking_id: "booking_id",
        #       key: "key"
        #     }
        #   })
        #
        # @return [Square::Types::BulkDeleteBookingCustomAttributesResponse]
        def batch_delete(request_options: {}, **params)
          params = Square::Internal::Types::Utils.normalize_keys(params)
          request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "POST",
            path: "v2/bookings/custom-attributes/bulk-delete",
            body: Square::Bookings::CustomAttributes::Types::BulkDeleteBookingCustomAttributesRequest.new(params).to_h,
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Square::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            (response.body.to_s.empty? ? nil : Square::Types::BulkDeleteBookingCustomAttributesResponse.load(response.body))
          else
            error_class = Square::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Bulk upserts bookings custom attributes.
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
        # @param params [Square::Bookings::CustomAttributes::Types::BulkUpsertBookingCustomAttributesRequest]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        #
        # @example
        #   client.bookings.custom_attributes.batch_upsert(values: {
        #     key: {
        #       booking_id: "booking_id",
        #       custom_attribute: {}
        #     }
        #   })
        #
        # @return [Square::Types::BulkUpsertBookingCustomAttributesResponse]
        def batch_upsert(request_options: {}, **params)
          params = Square::Internal::Types::Utils.normalize_keys(params)
          request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "POST",
            path: "v2/bookings/custom-attributes/bulk-upsert",
            body: Square::Bookings::CustomAttributes::Types::BulkUpsertBookingCustomAttributesRequest.new(params).to_h,
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Square::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            (response.body.to_s.empty? ? nil : Square::Types::BulkUpsertBookingCustomAttributesResponse.load(response.body))
          else
            error_class = Square::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Lists a booking's custom attributes.
        #
        # To call this endpoint with buyer-level permissions, set `APPOINTMENTS_READ` for the OAuth scope.
        # To call this endpoint with seller-level permissions, set `APPOINTMENTS_ALL_READ` and `APPOINTMENTS_READ` for
        # the OAuth scope.
        #
        # Returns a `Square::Internal::CursorItemIterator` that yields each `Square::Types::CustomAttribute` in the
        # `custom_attributes` field of every page, requesting pages as they are needed. Call `pages` on it to get each
        # page as a `Square::Types::ListBookingCustomAttributesResponse`, including its other fields.
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
        # @option params [String] :booking_id
        # @option params [Integer, nil] :limit
        # @option params [String, nil] :cursor
        # @option params [Boolean, nil] :with_definitions
        #
        # @example
        #   client.bookings.custom_attributes.list(
        #     booking_id: "booking_id",
        #     limit: 1,
        #     cursor: "cursor",
        #     with_definitions: true
        #   )
        #
        # @return [Square::Internal::CursorItemIterator]
        def list(request_options: {}, **params)
          params = Square::Internal::Types::Utils.normalize_keys(params)
          query_params = {}
          query_params["limit"] = params[:limit] if params.key?(:limit)
          query_params["cursor"] = params[:cursor] if params.key?(:cursor)
          query_params["with_definitions"] = params[:with_definitions] if params.key?(:with_definitions)

          Square::Internal::CursorItemIterator.new(
            cursor_field: :cursor,
            item_field: :custom_attributes,
            initial_cursor: query_params["cursor"]
          ) do |next_cursor|
            query_params["cursor"] = next_cursor
            request = Square::Internal::JSON::Request.new(
              base_url: request_options[:base_url],
              method: "GET",
              path: "v2/bookings/#{URI.encode_uri_component(params[:booking_id].to_s)}/custom-attributes",
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
              parsed_response = (response.body.to_s.empty? ? nil : Square::Types::ListBookingCustomAttributesResponse.load(response.body))
              [parsed_response, response]
            else
              error_class = Square::Errors::ResponseError.subclass_for_code(code)
              raise error_class.new(response.body, code: code)
            end
          end
        end

        # Retrieves a bookings custom attribute.
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
        # @option params [String] :booking_id
        # @option params [String] :key
        # @option params [Boolean, nil] :with_definition
        # @option params [Integer, nil] :version
        #
        # @example
        #   client.bookings.custom_attributes.get(
        #     booking_id: "booking_id",
        #     key: "key",
        #     with_definition: true,
        #     version: 1
        #   )
        #
        # @return [Square::Types::RetrieveBookingCustomAttributeResponse]
        def get(request_options: {}, **params)
          params = Square::Internal::Types::Utils.normalize_keys(params)
          query_params = {}
          query_params["with_definition"] = params[:with_definition] if params.key?(:with_definition)
          query_params["version"] = params[:version] if params.key?(:version)

          request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "GET",
            path: "v2/bookings/#{URI.encode_uri_component(params[:booking_id].to_s)}/custom-attributes/#{URI.encode_uri_component(params[:key].to_s)}",
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
            (response.body.to_s.empty? ? nil : Square::Types::RetrieveBookingCustomAttributeResponse.load(response.body))
          else
            error_class = Square::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Upserts a bookings custom attribute.
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
        # @param params [Square::Bookings::CustomAttributes::Types::UpsertBookingCustomAttributeRequest]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :booking_id
        # @option params [String] :key
        #
        # @example
        #   client.bookings.custom_attributes.upsert(
        #     booking_id: "booking_id",
        #     key: "key",
        #     custom_attribute: {}
        #   )
        #
        # @return [Square::Types::UpsertBookingCustomAttributeResponse]
        def upsert(request_options: {}, **params)
          params = Square::Internal::Types::Utils.normalize_keys(params)
          request_data = Square::Bookings::CustomAttributes::Types::UpsertBookingCustomAttributeRequest.new(params).to_h
          non_body_param_names = %w[booking_id key]
          body = request_data.except(*non_body_param_names)

          request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "PUT",
            path: "v2/bookings/#{URI.encode_uri_component(params[:booking_id].to_s)}/custom-attributes/#{URI.encode_uri_component(params[:key].to_s)}",
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
            (response.body.to_s.empty? ? nil : Square::Types::UpsertBookingCustomAttributeResponse.load(response.body))
          else
            error_class = Square::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Deletes a bookings custom attribute.
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
        # @option params [String] :booking_id
        # @option params [String] :key
        #
        # @example
        #   client.bookings.custom_attributes.delete(
        #     booking_id: "booking_id",
        #     key: "key"
        #   )
        #
        # @return [Square::Types::DeleteBookingCustomAttributeResponse]
        def delete(request_options: {}, **params)
          params = Square::Internal::Types::Utils.normalize_keys(params)
          request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "DELETE",
            path: "v2/bookings/#{URI.encode_uri_component(params[:booking_id].to_s)}/custom-attributes/#{URI.encode_uri_component(params[:key].to_s)}",
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Square::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            (response.body.to_s.empty? ? nil : Square::Types::DeleteBookingCustomAttributeResponse.load(response.body))
          else
            error_class = Square::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end
      end
    end
  end
end
