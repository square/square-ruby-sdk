# frozen_string_literal: true

module Square
  module Mobile
    class Client
      # @param client [Square::Internal::Http::RawClient]
      #
      # @return [void]
      def initialize(client:)
        @client = client
      end

      # __Note:__ This endpoint is used by the deprecated Reader SDK.
      # Developers should update their integration to use the [Mobile Payments
      # SDK](https://developer.squareup.com/docs/mobile-payments-sdk), which includes its own authorization methods.
      #
      # Generates code to authorize a mobile application to connect to a Square card reader.
      #
      # Authorization codes are one-time-use codes and expire 60 minutes after being issued.
      #
      # The `Authorization` header you provide to this endpoint must have the following format:
      #
      # ```
      # Authorization: Bearer ACCESS_TOKEN
      # ```
      #
      # Replace `ACCESS_TOKEN` with a
      # [valid production authorization credential](https://developer.squareup.com/docs/build-basics/access-tokens).
      #
      # @param request_options [Hash]
      # @param params [Square::Mobile::Types::CreateMobileAuthorizationCodeRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @return [Square::Types::CreateMobileAuthorizationCodeResponse]
      def authorization_code(request_options: {}, **params)
        body_prop_names = %i[location_id]
        body_bag = params.slice(*body_prop_names)

        request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "mobile/authorization-code",
          body: Square::Mobile::Types::CreateMobileAuthorizationCodeRequest.new(body_bag).to_h,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Square::Types::CreateMobileAuthorizationCodeResponse.load(response.body)
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end
    end
  end
end
