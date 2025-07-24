# frozen_string_literal: true
require_relative "../../requests"
require_relative "../types/revoke_token_response"
require_relative "../types/obtain_token_response"
require_relative "../types/retrieve_token_status_response"
require "async"
require "async"
require "async"
require "async"
require_relative "../../requests"

module square.rb
  class OAuthClient
  # @return [square.rb::RequestClient] 
    attr_reader :request_client


    # @param request_client [square.rb::RequestClient] 
    # @return [square.rb::OAuthClient]
    def initialize(request_client:)
      @request_client = request_client
    end
# Revokes an access token generated with the OAuth flow.
#  If an account has more than one OAuth access token for your application, this
#  endpoint revokes all of them, regardless of which token you specify.
#  __Important:__ The `Authorization` header for this endpoint must have the
#  following format:
#  ```
#  Authorization: Client APPLICATION_SECRET
#  ```
#  Replace `APPLICATION_SECRET` with the application secret on the **OAuth**
#  page for your application in the Developer Dashboard.
    #
    # @param client_id [String] The Square-issued ID for your application, which is available on the **OAuth**
#  page in the
#  [Developer Dashboard](https://developer.squareup.com/apps).
    # @param access_token [String] The access token of the merchant whose token you want to revoke.
#  Do not provide a value for `merchant_id` if you provide this parameter.
    # @param merchant_id [String] The ID of the merchant whose token you want to revoke.
#  Do not provide a value for `access_token` if you provide this parameter.
    # @param revoke_only_access_token [Boolean] If `true`, terminate the given single access token, but do not
#  terminate the entire authorization.
#  Default: `false`
    # @param request_options [square.rb::RequestOptions] 
    # @return [square.rb::RevokeTokenResponse]
    # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.o_auth.revoke_token(client_id: "CLIENT_ID", access_token: "ACCESS_TOKEN")
    def revoke_token(client_id: nil, access_token: nil, merchant_id: nil, revoke_only_access_token: nil, request_options: nil)
      response = @request_client.conn.post do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.version.nil?
    req.headers["Square-Version"] = request_options.version
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  req.body = { **(request_options&.additional_body_parameters || {}), client_id: client_id, access_token: access_token, merchant_id: merchant_id, revoke_only_access_token: revoke_only_access_token }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/oauth2/revoke"
end
      square.rb::RevokeTokenResponse.from_json(json_object: response.body)
    end
# Returns an OAuth access token and refresh token using the `authorization_code`
#  or `refresh_token` grant type.
#  When `grant_type` is `authorization_code`:
#  - With the [code
#  flow](https://developer.squareup.com/docs/oauth-api/overview#code-flow),
#  provide `code`, `client_id`, and `client_secret`.
#  - With the [PKCE
#  flow](https://developer.squareup.com/docs/oauth-api/overview#pkce-flow),
#  provide `code`, `client_id`, and `code_verifier`.
#  When `grant_type` is `refresh_token`:
#  - With the code flow, provide `refresh_token`, `client_id`, and `client_secret`.
#  The response returns the same refresh token provided in the request.
#  - With the PKCE flow, provide `refresh_token` and `client_id`. The response
#  returns
#  a new refresh token.
#  You can use the `scopes` parameter to limit the set of permissions authorized by
#  the
#  access token. You can use the `short_lived` parameter to create an access token
#  that
#  expires in 24 hours.
#  __Important:__ OAuth tokens should be encrypted and stored on a secure server.
#  Application clients should never interact directly with OAuth tokens.
    #
    # @param client_id [String] The Square-issued ID of your application, which is available as the
#  **Application ID**
#  on the **OAuth** page in the [Developer
#  Console](https://developer.squareup.com/apps).
#  Required for the code flow and PKCE flow for any grant type.
    # @param client_secret [String] The secret key for your application, which is available as the **Application
#  secret**
#  on the **OAuth** page in the [Developer
#  Console](https://developer.squareup.com/apps).
#  Required for the code flow for any grant type. Don't confuse your client secret
#  with your
#  personal access token.
    # @param code [String] The authorization code to exchange for an OAuth access token. This is the `code`
#  value that Square sent to your redirect URL in the authorization response.
#  Required for the code flow and PKCE flow if `grant_type` is
#  `authorization_code`.
    # @param redirect_uri [String] The redirect URL for your application, which you registered as the **Redirect
#  URL**
#  on the **OAuth** page in the [Developer
#  Console](https://developer.squareup.com/apps).
#  Required for the code flow and PKCE flow if `grant_type` is `authorization_code`
#  and
#  you provided the `redirect_uri` parameter in your authorization URL.
    # @param grant_type [String] The method used to obtain an OAuth access token. The request must include the
#  credential that corresponds to the specified grant type. Valid values are:
#  - `authorization_code` - Requires the `code` field.
#  - `refresh_token` - Requires the `refresh_token` field.
#  - `migration_token` - LEGACY for access tokens obtained using a Square API
#  version prior
#  to 2019-03-13. Requires the `migration_token` field.
    # @param refresh_token [String] A valid refresh token used to generate a new OAuth access token. This is a
#  refresh token that was returned in a previous `ObtainToken` response.
#  Required for the code flow and PKCE flow if `grant_type` is `refresh_token`.
    # @param migration_token [String] __LEGACY__ A valid access token (obtained using a Square API version prior to
#  2019-03-13)
#  used to generate a new OAuth access token.
#  Required if `grant_type` is `migration_token`. For more information, see
#  [Migrate to Using Refresh
#  okens](https://developer.squareup.com/docs/oauth-api/migrate-to-refresh-tokens).
    # @param scopes [Array<String>] The list of permissions that are explicitly requested for the access token.
#  For example, ["MERCHANT_PROFILE_READ","PAYMENTS_READ","BANK_ACCOUNTS_READ"].
#  The returned access token is limited to the permissions that are the
#  intersection
#  of these requested permissions and those authorized by the provided
#  `refresh_token`.
#  Optional for the code flow and PKCE flow if `grant_type` is `refresh_token`.
    # @param short_lived [Boolean] Indicates whether the returned access token should expire in 24 hours.
#  Optional for the code flow and PKCE flow for any grant type. The default value
#  is `false`.
    # @param code_verifier [String] The secret your application generated for the authorization request used to
#  obtain the authorization code. This is the source of the `code_challenge` hash
#  you
#  provided in your authorization URL.
#  Required for the PKCE flow if `grant_type` is `authorization_code`.
    # @param request_options [square.rb::RequestOptions] 
    # @return [square.rb::ObtainTokenResponse]
    # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.o_auth.obtain_token(
#    client_id: "sq0idp-uaPHILoPzWZk3tlJqlML0g",
#    client_secret: "sq0csp-30a-4C_tVOnTh14Piza2BfTPBXyLafLPWSzY1qAjeBfM",
#    code: "sq0cgb-l0SBqxs4uwxErTVyYOdemg",
#    grant_type: "authorization_code"
#  )
    def obtain_token(client_id:, client_secret: nil, code: nil, redirect_uri: nil, grant_type:, refresh_token: nil, migration_token: nil, scopes: nil, short_lived: nil, code_verifier: nil, request_options: nil)
      response = @request_client.conn.post do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.version.nil?
    req.headers["Square-Version"] = request_options.version
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  req.body = { **(request_options&.additional_body_parameters || {}), client_id: client_id, client_secret: client_secret, code: code, redirect_uri: redirect_uri, grant_type: grant_type, refresh_token: refresh_token, migration_token: migration_token, scopes: scopes, short_lived: short_lived, code_verifier: code_verifier }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/oauth2/token"
end
      square.rb::ObtainTokenResponse.from_json(json_object: response.body)
    end
# Returns information about an [OAuth access
#  eveloper.squareup.com/docs/build-basics/access-tokens#get-an-oauth-access-token)
#  or an application’s [personal access
#  loper.squareup.com/docs/build-basics/access-tokens#get-a-personal-access-token).
#  Add the access token to the Authorization header of the request.
#  __Important:__ The `Authorization` header you provide to this endpoint must have
#  the following format:
#  ```
#  Authorization: Bearer ACCESS_TOKEN
#  ```
#  where `ACCESS_TOKEN` is a
#  [valid production authorization
#  credential](https://developer.squareup.com/docs/build-basics/access-tokens).
#  If the access token is expired or not a valid access token, the endpoint returns
#  an `UNAUTHORIZED` error.
    #
    # @param request_options [square.rb::RequestOptions] 
    # @return [square.rb::RetrieveTokenStatusResponse]
    # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.o_auth.retrieve_token_status
    def retrieve_token_status(request_options: nil)
      response = @request_client.conn.post do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.version.nil?
    req.headers["Square-Version"] = request_options.version
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/oauth2/token/status"
end
      square.rb::RetrieveTokenStatusResponse.from_json(json_object: response.body)
    end
    # @param request_options [square.rb::RequestOptions] 
    # @return [Void]
    # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.o_auth.authorize
    def authorize(request_options: nil)
      response = @request_client.conn.get do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.version.nil?
    req.headers["Square-Version"] = request_options.version
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/oauth2/authorize"
end
    end
  end
  class AsyncOAuthClient
  # @return [square.rb::AsyncRequestClient] 
    attr_reader :request_client


    # @param request_client [square.rb::RequestClient] 
    # @return [square.rb::AsyncOAuthClient]
    def initialize(request_client:)
      @request_client = request_client
    end
# Revokes an access token generated with the OAuth flow.
#  If an account has more than one OAuth access token for your application, this
#  endpoint revokes all of them, regardless of which token you specify.
#  __Important:__ The `Authorization` header for this endpoint must have the
#  following format:
#  ```
#  Authorization: Client APPLICATION_SECRET
#  ```
#  Replace `APPLICATION_SECRET` with the application secret on the **OAuth**
#  page for your application in the Developer Dashboard.
    #
    # @param client_id [String] The Square-issued ID for your application, which is available on the **OAuth**
#  page in the
#  [Developer Dashboard](https://developer.squareup.com/apps).
    # @param access_token [String] The access token of the merchant whose token you want to revoke.
#  Do not provide a value for `merchant_id` if you provide this parameter.
    # @param merchant_id [String] The ID of the merchant whose token you want to revoke.
#  Do not provide a value for `access_token` if you provide this parameter.
    # @param revoke_only_access_token [Boolean] If `true`, terminate the given single access token, but do not
#  terminate the entire authorization.
#  Default: `false`
    # @param request_options [square.rb::RequestOptions] 
    # @return [square.rb::RevokeTokenResponse]
    # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.o_auth.revoke_token(client_id: "CLIENT_ID", access_token: "ACCESS_TOKEN")
    def revoke_token(client_id: nil, access_token: nil, merchant_id: nil, revoke_only_access_token: nil, request_options: nil)
      Async do
        response = @request_client.conn.post do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.version.nil?
    req.headers["Square-Version"] = request_options.version
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  req.body = { **(request_options&.additional_body_parameters || {}), client_id: client_id, access_token: access_token, merchant_id: merchant_id, revoke_only_access_token: revoke_only_access_token }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/oauth2/revoke"
end
        square.rb::RevokeTokenResponse.from_json(json_object: response.body)
      end
    end
# Returns an OAuth access token and refresh token using the `authorization_code`
#  or `refresh_token` grant type.
#  When `grant_type` is `authorization_code`:
#  - With the [code
#  flow](https://developer.squareup.com/docs/oauth-api/overview#code-flow),
#  provide `code`, `client_id`, and `client_secret`.
#  - With the [PKCE
#  flow](https://developer.squareup.com/docs/oauth-api/overview#pkce-flow),
#  provide `code`, `client_id`, and `code_verifier`.
#  When `grant_type` is `refresh_token`:
#  - With the code flow, provide `refresh_token`, `client_id`, and `client_secret`.
#  The response returns the same refresh token provided in the request.
#  - With the PKCE flow, provide `refresh_token` and `client_id`. The response
#  returns
#  a new refresh token.
#  You can use the `scopes` parameter to limit the set of permissions authorized by
#  the
#  access token. You can use the `short_lived` parameter to create an access token
#  that
#  expires in 24 hours.
#  __Important:__ OAuth tokens should be encrypted and stored on a secure server.
#  Application clients should never interact directly with OAuth tokens.
    #
    # @param client_id [String] The Square-issued ID of your application, which is available as the
#  **Application ID**
#  on the **OAuth** page in the [Developer
#  Console](https://developer.squareup.com/apps).
#  Required for the code flow and PKCE flow for any grant type.
    # @param client_secret [String] The secret key for your application, which is available as the **Application
#  secret**
#  on the **OAuth** page in the [Developer
#  Console](https://developer.squareup.com/apps).
#  Required for the code flow for any grant type. Don't confuse your client secret
#  with your
#  personal access token.
    # @param code [String] The authorization code to exchange for an OAuth access token. This is the `code`
#  value that Square sent to your redirect URL in the authorization response.
#  Required for the code flow and PKCE flow if `grant_type` is
#  `authorization_code`.
    # @param redirect_uri [String] The redirect URL for your application, which you registered as the **Redirect
#  URL**
#  on the **OAuth** page in the [Developer
#  Console](https://developer.squareup.com/apps).
#  Required for the code flow and PKCE flow if `grant_type` is `authorization_code`
#  and
#  you provided the `redirect_uri` parameter in your authorization URL.
    # @param grant_type [String] The method used to obtain an OAuth access token. The request must include the
#  credential that corresponds to the specified grant type. Valid values are:
#  - `authorization_code` - Requires the `code` field.
#  - `refresh_token` - Requires the `refresh_token` field.
#  - `migration_token` - LEGACY for access tokens obtained using a Square API
#  version prior
#  to 2019-03-13. Requires the `migration_token` field.
    # @param refresh_token [String] A valid refresh token used to generate a new OAuth access token. This is a
#  refresh token that was returned in a previous `ObtainToken` response.
#  Required for the code flow and PKCE flow if `grant_type` is `refresh_token`.
    # @param migration_token [String] __LEGACY__ A valid access token (obtained using a Square API version prior to
#  2019-03-13)
#  used to generate a new OAuth access token.
#  Required if `grant_type` is `migration_token`. For more information, see
#  [Migrate to Using Refresh
#  okens](https://developer.squareup.com/docs/oauth-api/migrate-to-refresh-tokens).
    # @param scopes [Array<String>] The list of permissions that are explicitly requested for the access token.
#  For example, ["MERCHANT_PROFILE_READ","PAYMENTS_READ","BANK_ACCOUNTS_READ"].
#  The returned access token is limited to the permissions that are the
#  intersection
#  of these requested permissions and those authorized by the provided
#  `refresh_token`.
#  Optional for the code flow and PKCE flow if `grant_type` is `refresh_token`.
    # @param short_lived [Boolean] Indicates whether the returned access token should expire in 24 hours.
#  Optional for the code flow and PKCE flow for any grant type. The default value
#  is `false`.
    # @param code_verifier [String] The secret your application generated for the authorization request used to
#  obtain the authorization code. This is the source of the `code_challenge` hash
#  you
#  provided in your authorization URL.
#  Required for the PKCE flow if `grant_type` is `authorization_code`.
    # @param request_options [square.rb::RequestOptions] 
    # @return [square.rb::ObtainTokenResponse]
    # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.o_auth.obtain_token(
#    client_id: "sq0idp-uaPHILoPzWZk3tlJqlML0g",
#    client_secret: "sq0csp-30a-4C_tVOnTh14Piza2BfTPBXyLafLPWSzY1qAjeBfM",
#    code: "sq0cgb-l0SBqxs4uwxErTVyYOdemg",
#    grant_type: "authorization_code"
#  )
    def obtain_token(client_id:, client_secret: nil, code: nil, redirect_uri: nil, grant_type:, refresh_token: nil, migration_token: nil, scopes: nil, short_lived: nil, code_verifier: nil, request_options: nil)
      Async do
        response = @request_client.conn.post do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.version.nil?
    req.headers["Square-Version"] = request_options.version
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  req.body = { **(request_options&.additional_body_parameters || {}), client_id: client_id, client_secret: client_secret, code: code, redirect_uri: redirect_uri, grant_type: grant_type, refresh_token: refresh_token, migration_token: migration_token, scopes: scopes, short_lived: short_lived, code_verifier: code_verifier }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/oauth2/token"
end
        square.rb::ObtainTokenResponse.from_json(json_object: response.body)
      end
    end
# Returns information about an [OAuth access
#  eveloper.squareup.com/docs/build-basics/access-tokens#get-an-oauth-access-token)
#  or an application’s [personal access
#  loper.squareup.com/docs/build-basics/access-tokens#get-a-personal-access-token).
#  Add the access token to the Authorization header of the request.
#  __Important:__ The `Authorization` header you provide to this endpoint must have
#  the following format:
#  ```
#  Authorization: Bearer ACCESS_TOKEN
#  ```
#  where `ACCESS_TOKEN` is a
#  [valid production authorization
#  credential](https://developer.squareup.com/docs/build-basics/access-tokens).
#  If the access token is expired or not a valid access token, the endpoint returns
#  an `UNAUTHORIZED` error.
    #
    # @param request_options [square.rb::RequestOptions] 
    # @return [square.rb::RetrieveTokenStatusResponse]
    # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.o_auth.retrieve_token_status
    def retrieve_token_status(request_options: nil)
      Async do
        response = @request_client.conn.post do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.version.nil?
    req.headers["Square-Version"] = request_options.version
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/oauth2/token/status"
end
        square.rb::RetrieveTokenStatusResponse.from_json(json_object: response.body)
      end
    end
    # @param request_options [square.rb::RequestOptions] 
    # @return [Void]
    # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.o_auth.authorize
    def authorize(request_options: nil)
      Async do
        response = @request_client.conn.get do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.version.nil?
    req.headers["Square-Version"] = request_options.version
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/oauth2/authorize"
end
      end
    end
  end
end