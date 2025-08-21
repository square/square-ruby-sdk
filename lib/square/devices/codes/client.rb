# frozen_string_literal: true

module Square
  module Devices
    module Codes
      class Client
        # @return [Square::Devices::Codes::Client]
        def initialize(client:)
          @client = client
        end

        # Lists all DeviceCodes associated with the merchant.
        #
        # @return [Square::Types::ListDeviceCodesResponse]
        def list(request_options: {}, **params)
          _query_param_names = %w[cursor location_id product_type status]
          _query = params.slice(*_query_param_names)
          params.except(*_query_param_names)

          _request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Square::Environment::SANDBOX,
            method: "GET",
            path: "v2/devices/codes",
            query: _query
          )
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Square::Types::ListDeviceCodesResponse.load(_response.body)
          end

          raise _response.body
        end

        # Creates a DeviceCode that can be used to login to a Square Terminal device to enter the connected
        # terminal mode.
        #
        # @return [Square::Types::CreateDeviceCodeResponse]
        def create(request_options: {}, **params)
          _request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Square::Environment::SANDBOX,
            method: "POST",
            path: "v2/devices/codes",
            body: params
          )
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Square::Types::CreateDeviceCodeResponse.load(_response.body)
          end

          raise _response.body
        end

        # Retrieves DeviceCode with the associated ID.
        #
        # @return [Square::Types::GetDeviceCodeResponse]
        def get(request_options: {}, **params)
          _request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Square::Environment::SANDBOX,
            method: "GET",
            path: "v2/devices/codes/#{params[:id]}"
          )
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Square::Types::GetDeviceCodeResponse.load(_response.body)
          end

          raise _response.body
        end
      end
    end
  end
end
