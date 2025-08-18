
module Square
  module Devices
    class Client
      # @option client [Square::Internal::Http::RawClient]
      #
      # @return [Square::Devices::Client]
      def initialize(client)
        @client = client
      end

      # List devices associated with the merchant. Currently, only Terminal API
      # devices are supported.
      #
      # @return [Square::Types::ListDevicesResponse]
      def list(request_options: {}, **params)
        _request = params
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::ListDevicesResponse.load(_response.body)
        else
          raise _response.body
        end
      end

      # Retrieves Device with the associated `device_id`.
      #
      # @return [Square::Types::GetDeviceResponse]
      def get(request_options: {}, **params)
        _request = params
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::GetDeviceResponse.load(_response.body)
        else
          raise _response.body
        end
      end

    end
  end
end
