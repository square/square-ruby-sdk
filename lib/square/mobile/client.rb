
module Square
  module Mobile
    class Client
      # @option client [Square::Internal::Http::RawClient]
      #
      # @return [Square::Mobile::Client]
      def initialize(client)
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
      # @return [Square::CreateMobileAuthorizationCodeResponse]
      def authorization_code(request_options: {}, **params)
        _request = params

        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::CreateMobileAuthorizationCodeResponse.load(_response.body)

        else
          raise _response.body
      end

    end
  end
end
