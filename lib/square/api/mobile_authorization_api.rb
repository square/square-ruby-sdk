module Square
  # MobileAuthorizationApi
  class MobileAuthorizationApi < BaseApi
    def initialize(config, http_call_back: nil)
      super(config, http_call_back: http_call_back)
    end

    # Generates code to authorize a mobile application to connect to a Square
    # card reader
    # Authorization codes are one-time-use and expire __60 minutes__ after being
    # issued.
    # __Important:__ The `Authorization` header you provide to this endpoint
    # must have the following format:
    # ```
    # Authorization: Bearer ACCESS_TOKEN
    # ```
    # Replace `ACCESS_TOKEN` with a
    # [valid production authorization
    # credential](https://developer.squareup.com/docs/docs/build-basics/access-t
    # okens).
    # @param [CreateMobileAuthorizationCodeRequest] body Required parameter: An
    # object containing the fields to POST for the request.  See the
    # corresponding object definition for field details.
    # @return [CreateMobileAuthorizationCodeResponse Hash] response from the API call
    def create_mobile_authorization_code(body:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/mobile/authorization-code'
      _query_url = APIHelper.clean_url _query_builder

      # Prepare headers.
      _headers = {
        'accept' => 'application/json',
        'content-type' => 'application/json; charset=utf-8'
      }

      # Prepare and execute HttpRequest.
      _request = config.http_client.post(
        _query_url,
        headers: _headers,
        parameters: body.to_json
      )
      OAuth2.apply(config, _request)
      _response = execute_request(_request)

      # Return appropriate response type.
      decoded = APIHelper.json_deserialize(_response.raw_body)
      _errors = APIHelper.map_response(decoded, ['errors'])
      ApiResponse.new(_response, data: decoded, errors: _errors)
    end
  end
end
