# frozen_string_literal: true

module Square
  module Devices
    module Codes
      class Client
        # @param client [Square::Internal::Http::RawClient]
        #
        # @return [void]
        def initialize(client:)
          @client = client
        end

        # Lists all DeviceCodes associated with the merchant.
        #
        # Returns a `Square::Internal::CursorItemIterator` that yields each `Square::Types::DeviceCode` in the
        # `device_codes` field of every page, requesting pages as they are needed. Call `pages` on it to get each page
        # as a `Square::Types::ListDeviceCodesResponse`, including its other fields.
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
        # @option params [String, nil] :cursor
        # @option params [String, nil] :location_id
        # @option params [String, nil] :product_type
        # @option params [Square::Types::DeviceCodeStatus, nil] :status
        #
        # @example
        #   client.devices.codes.list(
        #     cursor: "cursor",
        #     location_id: "location_id",
        #     product_type: "TERMINAL_API",
        #     status: "UNKNOWN"
        #   )
        #
        # @return [Square::Internal::CursorItemIterator]
        def list(request_options: {}, **params)
          params = Square::Internal::Types::Utils.normalize_keys(params)
          query_params = {}
          query_params["cursor"] = params[:cursor] if params.key?(:cursor)
          query_params["location_id"] = params[:location_id] if params.key?(:location_id)
          query_params["product_type"] = params[:product_type] if params.key?(:product_type)
          query_params["status"] = params[:status] if params.key?(:status)

          Square::Internal::CursorItemIterator.new(
            cursor_field: :cursor,
            item_field: :device_codes,
            initial_cursor: query_params["cursor"]
          ) do |next_cursor|
            query_params["cursor"] = next_cursor
            request = Square::Internal::JSON::Request.new(
              base_url: request_options[:base_url],
              method: "GET",
              path: "v2/devices/codes",
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
              parsed_response = (response.body.to_s.empty? ? nil : Square::Types::ListDeviceCodesResponse.load(response.body))
              [parsed_response, response]
            else
              error_class = Square::Errors::ResponseError.subclass_for_code(code)
              raise error_class.new(response.body, code: code)
            end
          end
        end

        # Creates a DeviceCode that can be used to login to a Square Terminal device to enter the connected
        # terminal mode.
        #
        # @param request_options [Hash]
        # @param params [Square::Devices::Codes::Types::CreateDeviceCodeRequest]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        #
        # @example
        #   client.devices.codes.create(
        #     idempotency_key: "01bb00a6-0c86-4770-94ed-f5fca973cd56",
        #     device_code: {
        #       name: "Counter 1",
        #       product_type: "TERMINAL_API",
        #       location_id: "B5E4484SHHNYH"
        #     }
        #   )
        #
        # @return [Square::Types::CreateDeviceCodeResponse]
        def create(request_options: {}, **params)
          params = Square::Internal::Types::Utils.normalize_keys(params)
          request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "POST",
            path: "v2/devices/codes",
            body: Square::Devices::Codes::Types::CreateDeviceCodeRequest.new(params).to_h,
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Square::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            (response.body.to_s.empty? ? nil : Square::Types::CreateDeviceCodeResponse.load(response.body))
          else
            error_class = Square::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Retrieves DeviceCode with the associated ID.
        #
        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :id
        #
        # @example
        #   client.devices.codes.get(id: "id")
        #
        # @return [Square::Types::GetDeviceCodeResponse]
        def get(request_options: {}, **params)
          params = Square::Internal::Types::Utils.normalize_keys(params)
          request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "GET",
            path: "v2/devices/codes/#{URI.encode_uri_component(params[:id].to_s)}",
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Square::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            (response.body.to_s.empty? ? nil : Square::Types::GetDeviceCodeResponse.load(response.body))
          else
            error_class = Square::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end
      end
    end
  end
end
