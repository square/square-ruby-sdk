# frozen_string_literal: true

module Square
  module OAuth
    class Client
      # @return [Square::OAuth::Client]
      def initialize(client:)
        @client = client
      end

      # Revokes an access token generated with the OAuth flow.
      #
      # If an account has more than one OAuth access token for your application, this
      # endpoint revokes all of them, regardless of which token you specify.
      #
      # __Important:__ The `Authorization` header for this endpoint must have the
      # following format:
      #
      # ```
      # Authorization: Client APPLICATION_SECRET
      # ```
      #
      # Replace `APPLICATION_SECRET` with the application secret on the **OAuth**
      # page for your application in the Developer Dashboard.
      #
      # @return [Square::Types::RevokeTokenResponse]
      def revoke_token(request_options: {}, **params)
        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::PRODUCTION,
          method: "POST",
          path: "oauth2/revoke",
          body: params
        )
        begin
          _response = @client.send(_request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = _response.code.to_i
        if code.between?(200, 299)
          Square::Types::RevokeTokenResponse.load(_response.body)
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(_response.body, code: code)
        end
      end

      # Returns an OAuth access token and refresh token using the `authorization_code`
      # or `refresh_token` grant type.
      #
      # When `grant_type` is `authorization_code`:
      # - With the [code flow](https://developer.squareup.com/docs/oauth-api/overview#code-flow),
      # provide `code`, `client_id`, and `client_secret`.
      # - With the [PKCE flow](https://developer.squareup.com/docs/oauth-api/overview#pkce-flow),
      # provide `code`, `client_id`, and `code_verifier`.
      #
      # When `grant_type` is `refresh_token`:
      # - With the code flow, provide `refresh_token`, `client_id`, and `client_secret`.
      # The response returns the same refresh token provided in the request.
      # - With the PKCE flow, provide `refresh_token` and `client_id`. The response returns
      # a new refresh token.
      #
      # You can use the `scopes` parameter to limit the set of permissions authorized by the
      # access token. You can use the `short_lived` parameter to create an access token that
      # expires in 24 hours.
      #
      # __Important:__ OAuth tokens should be encrypted and stored on a secure server.
      # Application clients should never interact directly with OAuth tokens.
      #
      # @return [Square::Types::ObtainTokenResponse]
      def obtain_token(request_options: {}, **params)
        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::PRODUCTION,
          method: "POST",
          path: "oauth2/token",
          body: params
        )
        begin
          _response = @client.send(_request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = _response.code.to_i
        if code.between?(200, 299)
          Square::Types::ObtainTokenResponse.load(_response.body)
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(_response.body, code: code)
        end
      end

      # Returns information about an [OAuth access token](https://developer.squareup.com/docs/build-basics/access-tokens#get-an-oauth-access-token) or an application’s [personal access token](https://developer.squareup.com/docs/build-basics/access-tokens#get-a-personal-access-token).
      #
      # Add the access token to the Authorization header of the request.
      #
      # __Important:__ The `Authorization` header you provide to this endpoint must have the following format:
      #
      # ```
      # Authorization: Bearer ACCESS_TOKEN
      # ```
      #
      # where `ACCESS_TOKEN` is a
      # [valid production authorization credential](https://developer.squareup.com/docs/build-basics/access-tokens).
      #
      # If the access token is expired or not a valid access token, the endpoint returns an `UNAUTHORIZED` error.
      #
      # @return [Square::Types::RetrieveTokenStatusResponse]
      def retrieve_token_status(request_options: {}, **_params)
        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::PRODUCTION,
          method: "POST",
          path: "oauth2/token/status"
        )
        begin
          _response = @client.send(_request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = _response.code.to_i
        if code.between?(200, 299)
          Square::Types::RetrieveTokenStatusResponse.load(_response.body)
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(_response.body, code: code)
        end
      end

      # @return [untyped]
      def authorize(request_options: {}, **_params)
        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::PRODUCTION,
          method: "GET",
          path: "oauth2/authorize"
        )
        begin
          _response = @client.send(_request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = _response.code.to_i
        return if code.between?(200, 299)

        error_class = Square::Errors::ResponseError.subclass_for_code(code)
        raise error_class.new(_response.body, code: code)
      end
    end
  end
end
