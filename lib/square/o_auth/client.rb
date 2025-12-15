# frozen_string_literal: true

module Square
  module OAuth
    class Client
      # @param client [Square::Internal::Http::RawClient]
      #
      # @return [void]
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
      # @param request_options [Hash]
      # @param params [Square::OAuth::Types::RevokeTokenRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @return [Square::Types::RevokeTokenResponse]
      def revoke_token(request_options: {}, **params)
        body_prop_names = %i[client_id access_token merchant_id revoke_only_access_token]
        body_bag = params.slice(*body_prop_names)

        request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "oauth2/revoke",
          body: Square::OAuth::Types::RevokeTokenRequest.new(body_bag).to_h,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Square::Types::RevokeTokenResponse.load(response.body)
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
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
      # @param request_options [Hash]
      # @param params [Square::OAuth::Types::ObtainTokenRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @return [Square::Types::ObtainTokenResponse]
      def obtain_token(request_options: {}, **params)
        body_prop_names = %i[client_id client_secret code redirect_uri grant_type refresh_token migration_token scopes short_lived code_verifier]
        body_bag = params.slice(*body_prop_names)

        request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "oauth2/token",
          body: Square::OAuth::Types::ObtainTokenRequest.new(body_bag).to_h,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Square::Types::ObtainTokenResponse.load(response.body)
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Returns information about an [OAuth access
      # token](https://developer.squareup.com/docs/build-basics/access-tokens#get-an-oauth-access-token) or an
      # application’s [personal access
      # token](https://developer.squareup.com/docs/build-basics/access-tokens#get-a-personal-access-token).
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
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @return [Square::Types::RetrieveTokenStatusResponse]
      def retrieve_token_status(request_options: {}, **_params)
        request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "oauth2/token/status",
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Square::Types::RetrieveTokenStatusResponse.load(response.body)
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @return [untyped]
      def authorize(request_options: {}, **_params)
        request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "oauth2/authorize",
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = response.code.to_i
        return if code.between?(200, 299)

        error_class = Square::Errors::ResponseError.subclass_for_code(code)
        raise error_class.new(response.body, code: code)
      end
    end
  end
end
