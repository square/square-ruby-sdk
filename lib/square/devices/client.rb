# frozen_string_literal: true

module Square
  module Devices
    class Client
      # @return [Square::Devices::Client]
      def initialize(client:)
        @client = client
      end

      # List devices associated with the merchant. Currently, only Terminal API
      # devices are supported.
      #
      # @return [Square::Types::ListDevicesResponse]
      def list(request_options: {}, **params)
        _query_param_names = [
          %w[cursor sort_order limit location_id],
          %i[cursor sort_order limit location_id]
        ].flatten
        _query = params.slice(*_query_param_names)
        params.except(*_query_param_names)

        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::SANDBOX,
          method: "GET",
          path: "v2/devices",
          query: _query
        )
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::ListDevicesResponse.load(_response.body)
        end

        raise _response.body
      end

      # Retrieves Device with the associated `device_id`.
      #
      # @return [Square::Types::GetDeviceResponse]
      def get(request_options: {}, **params)
        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::SANDBOX,
          method: "GET",
          path: "v2/devices/#{params[:device_id]}"
        )
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::GetDeviceResponse.load(_response.body)
        end

        raise _response.body
      end

      # @return [Square::Codes::Client]
      def codes
        @codes ||= Square::Devices::Codes::Client.new(client: @client)
      end
    end
  end
end
