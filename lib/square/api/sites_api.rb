module Square
  # SitesApi
  class SitesApi < BaseApi
    # Lists the Square Online sites that belong to a seller. Sites are listed in
    # descending order by the `created_at` date.
    # __Note:__ Square Online APIs are publicly available as part of an early
    # access program. For more information, see [Early access program for Square
    # Online
    # APIs](https://developer.squareup.com/docs/online-api#early-access-program-
    # for-square-online-apis).
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def list_sites
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::GET,
                                     '/v2/sites',
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
