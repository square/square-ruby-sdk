module Square
  # OAuthApi
  class OAuthApi < BaseApi
    def initialize(config, http_call_back: nil)
      super(config, http_call_back: http_call_back)
    end

    # `RenewToken` is deprecated. For information about refreshing OAuth access
    # tokens, see
    # [Migrate from Renew to Refresh OAuth
    # Tokens](https://developer.squareup.com/docs/oauth-api/migrate-to-refresh-t
    # okens).
    # Renews an OAuth access token before it expires.
    # OAuth access tokens besides your application's personal access token
    # expire after __30 days__.
    # You can also renew expired tokens within __15 days__ of their expiration.
    # You cannot renew an access token that has been expired for more than 15
    # days.
    # Instead, the associated user must re-complete the OAuth flow from the
    # beginning.
    # __Important:__ The `Authorization` header for this endpoint must have the
    # following format:
    # ```
    # Authorization: Client APPLICATION_SECRET
    # ```
    # Replace `APPLICATION_SECRET` with the application secret on the
    # Credentials
    # page in the [developer dashboard](https://developer.squareup.com/apps).
    # @param [String] client_id Required parameter: Your application ID,
    # available from the OAuth page for your  application on the Developer
    # Dashboard.
    # @param [RenewTokenRequest] body Required parameter: An object containing
    # the fields to POST for the request.  See the corresponding object
    # definition for field details.
    # @param [String] authorization Required parameter: Client
    # APPLICATION_SECRET
    # @return [RenewTokenResponse Hash] response from the API call
    def renew_token(client_id:,
                    body:,
                    authorization:)
      warn 'Endpoint renew_token in OAuthApi is deprecated'
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/oauth2/clients/{client_id}/access-token/renew'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'client_id' => { 'value' => client_id, 'encode' => true }
      )
      _query_url = APIHelper.clean_url _query_builder

      # Prepare headers.
      _headers = {
        'accept' => 'application/json',
        'Content-Type' => 'application/json',
        'Authorization' => authorization
      }

      # Prepare and execute HttpRequest.
      _request = config.http_client.post(
        _query_url,
        headers: _headers,
        parameters: body.to_json
      )
      _response = execute_request(_request)

      # Return appropriate response type.
      decoded = APIHelper.json_deserialize(_response.raw_body)
      _errors = APIHelper.map_response(decoded, ['errors'])
      ApiResponse.new(
        _response, data: decoded, errors: _errors
      )
    end

    # Revokes an access token generated with the OAuth flow.
    # If an account has more than one OAuth access token for your application,
    # this
    # endpoint revokes all of them, regardless of which token you specify. When
    # an
    # OAuth access token is revoked, all of the active subscriptions associated
    # with that OAuth token are canceled immediately.
    # __Important:__ The `Authorization` header for this endpoint must have the
    # following format:
    # ```
    # Authorization: Client APPLICATION_SECRET
    # ```
    # Replace `APPLICATION_SECRET` with the application secret on the OAuth
    # page for your application on the Developer Dashboard.
    # @param [RevokeTokenRequest] body Required parameter: An object containing
    # the fields to POST for the request.  See the corresponding object
    # definition for field details.
    # @param [String] authorization Required parameter: Client
    # APPLICATION_SECRET
    # @return [RevokeTokenResponse Hash] response from the API call
    def revoke_token(body:,
                     authorization:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/oauth2/revoke'
      _query_url = APIHelper.clean_url _query_builder

      # Prepare headers.
      _headers = {
        'accept' => 'application/json',
        'Content-Type' => 'application/json',
        'Authorization' => authorization
      }

      # Prepare and execute HttpRequest.
      _request = config.http_client.post(
        _query_url,
        headers: _headers,
        parameters: body.to_json
      )
      _response = execute_request(_request)

      # Return appropriate response type.
      decoded = APIHelper.json_deserialize(_response.raw_body)
      _errors = APIHelper.map_response(decoded, ['errors'])
      ApiResponse.new(
        _response, data: decoded, errors: _errors
      )
    end

    # Returns an OAuth access token and a refresh token unless the
    # `short_lived` parameter is set to `true`, in which case the endpoint
    # returns only an access token.
    # The `grant_type` parameter specifies the type of OAuth request. If
    # `grant_type` is `authorization_code`, you must include the authorization
    # code you received when a seller granted you authorization. If `grant_type`
    # is `refresh_token`, you must provide a valid refresh token. If you are
    # using
    # an old version of the Square APIs (prior to March 13, 2019), `grant_type`
    # can be `migration_token` and you must provide a valid migration token.
    # You can use the `scopes` parameter to limit the set of permissions granted
    # to the access token and refresh token. You can use the `short_lived`
    # parameter
    # to create an access token that expires in 24 hours.
    # __Note:__ OAuth tokens should be encrypted and stored on a secure server.
    # Application clients should never interact directly with OAuth tokens.
    # @param [ObtainTokenRequest] body Required parameter: An object containing
    # the fields to POST for the request.  See the corresponding object
    # definition for field details.
    # @return [ObtainTokenResponse Hash] response from the API call
    def obtain_token(body:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/oauth2/token'
      _query_url = APIHelper.clean_url _query_builder

      # Prepare headers.
      _headers = {
        'accept' => 'application/json',
        'Content-Type' => 'application/json'
      }

      # Prepare and execute HttpRequest.
      _request = config.http_client.post(
        _query_url,
        headers: _headers,
        parameters: body.to_json
      )
      _response = execute_request(_request)

      # Return appropriate response type.
      decoded = APIHelper.json_deserialize(_response.raw_body)
      _errors = APIHelper.map_response(decoded, ['errors'])
      ApiResponse.new(
        _response, data: decoded, errors: _errors
      )
    end
  end
end
