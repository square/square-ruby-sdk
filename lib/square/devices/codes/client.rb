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
        # @return [Square::Types::ListDeviceCodesResponse]
        def list(request_options: {}, **params)
          params = Square::Internal::Types::Utils.normalize_keys(params)
          query_param_names = %i[cursor location_id product_type status]
          query_params = {}
          query_params["cursor"] = params[:cursor] if params.key?(:cursor)
          query_params["location_id"] = params[:location_id] if params.key?(:location_id)
          query_params["product_type"] = params[:product_type] if params.key?(:product_type)
          query_params["status"] = params[:status] if params.key?(:status)
          params.except(*query_param_names)

          Square::Internal::CursorItemIterator.new(
            cursor_field: :cursor,
            item_field: :device_codes,
            initial_cursor: query_params[:cursor]
          ) do |next_cursor|
            query_params[:cursor] = next_cursor
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
              Square::Types::ListDeviceCodesResponse.load(response.body)
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
            Square::Types::CreateDeviceCodeResponse.load(response.body)
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
        # @return [Square::Types::GetDeviceCodeResponse]
        def get(request_options: {}, **params)
          params = Square::Internal::Types::Utils.normalize_keys(params)
          request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "GET",
            path: "v2/devices/codes/#{params[:id]}",
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Square::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Square::Types::GetDeviceCodeResponse.load(response.body)
          else
            error_class = Square::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end
      end
    end
  end
end
