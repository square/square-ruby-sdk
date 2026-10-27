# frozen_string_literal: true

module Square
  module Devices
    class Client
      # @param client [Square::Internal::Http::RawClient]
      #
      # @return [void]
      def initialize(client:)
        @client = client
      end

      # List devices associated with the merchant. Currently, only Terminal API
      # devices are supported.
      #
      # Returns a `Square::Internal::CursorItemIterator` that yields each `Square::Types::Device` in the `devices` field
      # of every page, requesting pages as they are needed. Call `pages` on it to get each page as a
      # `Square::Types::ListDevicesResponse`, including its other fields.
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
      # @option params [Square::Types::SortOrder, nil] :sort_order
      # @option params [Integer, nil] :limit
      # @option params [String, nil] :location_id
      #
      # @example
      #   client.devices.list(
      #     cursor: "cursor",
      #     sort_order: "DESC",
      #     limit: 1,
      #     location_id: "location_id"
      #   )
      #
      # @return [Square::Internal::CursorItemIterator]
      def list(request_options: {}, **params)
        params = Square::Internal::Types::Utils.normalize_keys(params)
        query_params = {}
        query_params["cursor"] = params[:cursor] if params.key?(:cursor)
        query_params["sort_order"] = params[:sort_order] if params.key?(:sort_order)
        query_params["limit"] = params[:limit] if params.key?(:limit)
        query_params["location_id"] = params[:location_id] if params.key?(:location_id)

        Square::Internal::CursorItemIterator.new(
          cursor_field: :cursor,
          item_field: :devices,
          initial_cursor: query_params["cursor"]
        ) do |next_cursor|
          query_params["cursor"] = next_cursor
          request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "GET",
            path: "v2/devices",
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
            parsed_response = (response.body.to_s.empty? ? nil : Square::Types::ListDevicesResponse.load(response.body))
            [parsed_response, response]
          else
            error_class = Square::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end
      end

      # Retrieves Device with the associated `device_id`.
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :device_id
      #
      # @example
      #   client.devices.get(device_id: "device_id")
      #
      # @return [Square::Types::GetDeviceResponse]
      def get(request_options: {}, **params)
        params = Square::Internal::Types::Utils.normalize_keys(params)
        request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "v2/devices/#{URI.encode_uri_component(params[:device_id].to_s)}",
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          (response.body.to_s.empty? ? nil : Square::Types::GetDeviceResponse.load(response.body))
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # @return [Square::Codes::Client]
      def codes
        @codes ||= Square::Devices::Codes::Client.new(client: @client)
      end
    end
  end
end
