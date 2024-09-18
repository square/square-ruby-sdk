module Square
  # OAuthApi
  class OAuthApi < BaseApi
    # Revokes an access token generated with the OAuth flow.
    # If an account has more than one OAuth access token for your application,
    # this
    # endpoint revokes all of them, regardless of which token you specify.
    # __Important:__ The `Authorization` header for this endpoint must have the
    # following format:
    # ```
    # Authorization: Client APPLICATION_SECRET
    # ```
    # Replace `APPLICATION_SECRET` with the application secret on the **OAuth**
    # page for your application in the Developer Dashboard.
    # @param [RevokeTokenRequest] body Required parameter: An object containing
    # the fields to POST for the request.  See the corresponding object
    # definition for field details.
    # @param [String] authorization Required parameter: Client
    # APPLICATION_SECRET
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def revoke_token(body:,
                     authorization:)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::POST,
                                     '/oauth2/revoke',
                                     'default')
                   .header_param(new_parameter('application/json', key: 'Content-Type'))
                   .body_param(new_parameter(body))
                   .header_param(new_parameter(authorization, key: 'Authorization'))
                   .header_param(new_parameter('application/json', key: 'accept'))
                   .body_serializer(proc do |param| param.to_json unless param.nil? end))
        .response(new_response_handler
                    .deserializer(APIHelper.method(:json_deserialize))
                    .is_api_response(true)
                    .convertor(ApiResponse.method(:create)))
        .execute
    end

    # Returns an OAuth access token and a refresh token unless the
    # `short_lived` parameter is set to `true`, in which case the endpoint
    # returns only an access token.
    # The `grant_type` parameter specifies the type of OAuth request. If
    # `grant_type` is `authorization_code`, you must include the authorization
    # code you received when a seller granted you authorization. If `grant_type`
    # is `refresh_token`, you must provide a valid refresh token. If you're
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
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def obtain_token(body:)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::POST,
                                     '/oauth2/token',
                                     'default')
                   .header_param(new_parameter('application/json', key: 'Content-Type'))
                   .body_param(new_parameter(body))
                   .header_param(new_parameter('application/json', key: 'accept'))
                   .body_serializer(proc do |param| param.to_json unless param.nil? end))
        .response(new_response_handler
                    .deserializer(APIHelper.method(:json_deserialize))
                    .is_api_response(true)
                    .convertor(ApiResponse.method(:create)))
        .execute
    end

    # Returns information about an [OAuth access
    # token](https://developer.squareup.com/docs/build-basics/access-tokens#get-
    # an-oauth-access-token) or an application’s [personal access
    # token](https://developer.squareup.com/docs/build-basics/access-tokens#get-
    # a-personal-access-token).
    # Add the access token to the Authorization header of the request.
    # __Important:__ The `Authorization` header you provide to this endpoint
    # must have the following format:
    # ```
    # Authorization: Bearer ACCESS_TOKEN
    # ```
    # where `ACCESS_TOKEN` is a
    # [valid production authorization
    # credential](https://developer.squareup.com/docs/build-basics/access-tokens
    # ).
    # If the access token is expired or not a valid access token, the endpoint
    # returns an `UNAUTHORIZED` error.
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def retrieve_token_status
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::POST,
                                     '/oauth2/token/status',
                                     'default')
                   .header_param(new_parameter('application/json', key: 'accept'))
                   .auth(Single.new('global')))
        .response(new_response_handler
                    .deserializer(APIHelper.method(:json_deserialize))
                    .is_api_response(true)
                    .convertor(ApiResponse.method(:create)))
        .execute
    end
  end
end
