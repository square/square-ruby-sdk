# frozen_string_literal: true

module Square
  module Mobile
    class Client
      # @return [Square::Mobile::Client]
      def initialize(client:)
        @client = client
      end

      # __Note:__ This endpoint is used by the deprecated Reader SDK.
      # Developers should update their integration to use the [Mobile Payments SDK](https://developer.squareup.com/docs/mobile-payments-sdk), which includes its own authorization methods.
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
      # @return [Square::Types::CreateMobileAuthorizationCodeResponse]
      def authorization_code(request_options: {}, **params)
        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::PRODUCTION,
          method: "POST",
          path: "mobile/authorization-code",
          body: params
        )
        begin
          _response = @client.send(_request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = _response.code.to_i
        if code.between?(200, 299)
          Square::Types::CreateMobileAuthorizationCodeResponse.load(_response.body)
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(_response.body, code: code)
        end
      end
    end
  end
end
