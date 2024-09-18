module Square
  # MobileAuthorizationApi
  class MobileAuthorizationApi < BaseApi
    # Generates code to authorize a mobile application to connect to a Square
    # card reader.
    # Authorization codes are one-time-use codes and expire 60 minutes after
    # being issued.
    # __Important:__ The `Authorization` header you provide to this endpoint
    # must have the following format:
    # ```
    # Authorization: Bearer ACCESS_TOKEN
    # ```
    # Replace `ACCESS_TOKEN` with a
    # [valid production authorization
    # credential](https://developer.squareup.com/docs/build-basics/access-tokens
    # ).
    # @param [CreateMobileAuthorizationCodeRequest] body Required parameter: An
    # object containing the fields to POST for the request.  See the
    # corresponding object definition for field details.
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def create_mobile_authorization_code(body:)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::POST,
                                     '/mobile/authorization-code',
                                     'default')
                   .header_param(new_parameter('application/json', key: 'Content-Type'))
                   .body_param(new_parameter(body))
                   .header_param(new_parameter('application/json', key: 'accept'))
                   .body_serializer(proc do |param| param.to_json unless param.nil? end)
                   .auth(Single.new('global')))
        .response(new_response_handler
                    .deserializer(APIHelper.method(:json_deserialize))
                    .is_api_response(true)
                    .convertor(ApiResponse.method(:create)))
        .execute
    end
  end
end
