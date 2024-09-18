module Square
  # SnippetsApi
  class SnippetsApi < BaseApi
    # Removes your snippet from a Square Online site.
    # You can call [ListSites]($e/Sites/ListSites) to get the IDs of the sites
    # that belong to a seller.
    # __Note:__ Square Online APIs are publicly available as part of an early
    # access program. For more information, see [Early access program for Square
    # Online
    # APIs](https://developer.squareup.com/docs/online-api#early-access-program-
    # for-square-online-apis).
    # @param [String] site_id Required parameter: The ID of the site that
    # contains the snippet.
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def delete_snippet(site_id:)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::DELETE,
                                     '/v2/sites/{site_id}/snippet',
                                     'default')
                   .template_param(new_parameter(site_id, key: 'site_id')
                                    .should_encode(true))
                   .header_param(new_parameter('application/json', key: 'accept'))
                   .auth(Single.new('global')))
        .response(new_response_handler
                    .deserializer(APIHelper.method(:json_deserialize))
                    .is_api_response(true)
                    .convertor(ApiResponse.method(:create)))
        .execute
    end

    # Retrieves your snippet from a Square Online site. A site can contain
    # snippets from multiple snippet applications, but you can retrieve only the
    # snippet that was added by your application.
    # You can call [ListSites]($e/Sites/ListSites) to get the IDs of the sites
    # that belong to a seller.
    # __Note:__ Square Online APIs are publicly available as part of an early
    # access program. For more information, see [Early access program for Square
    # Online
    # APIs](https://developer.squareup.com/docs/online-api#early-access-program-
    # for-square-online-apis).
    # @param [String] site_id Required parameter: The ID of the site that
    # contains the snippet.
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def retrieve_snippet(site_id:)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::GET,
                                     '/v2/sites/{site_id}/snippet',
                                     'default')
                   .template_param(new_parameter(site_id, key: 'site_id')
                                    .should_encode(true))
                   .header_param(new_parameter('application/json', key: 'accept'))
                   .auth(Single.new('global')))
        .response(new_response_handler
                    .deserializer(APIHelper.method(:json_deserialize))
                    .is_api_response(true)
                    .convertor(ApiResponse.method(:create)))
        .execute
    end

    # Adds a snippet to a Square Online site or updates the existing snippet on
    # the site.
    # The snippet code is appended to the end of the `head` element on every
    # page of the site, except checkout pages. A snippet application can add one
    # snippet to a given site.
    # You can call [ListSites]($e/Sites/ListSites) to get the IDs of the sites
    # that belong to a seller.
    # __Note:__ Square Online APIs are publicly available as part of an early
    # access program. For more information, see [Early access program for Square
    # Online
    # APIs](https://developer.squareup.com/docs/online-api#early-access-program-
    # for-square-online-apis).
    # @param [String] site_id Required parameter: The ID of the site where you
    # want to add or update the snippet.
    # @param [UpsertSnippetRequest] body Required parameter: An object
    # containing the fields to POST for the request.  See the corresponding
    # object definition for field details.
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def upsert_snippet(site_id:,
                       body:)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::POST,
                                     '/v2/sites/{site_id}/snippet',
                                     'default')
                   .template_param(new_parameter(site_id, key: 'site_id')
                                    .should_encode(true))
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
