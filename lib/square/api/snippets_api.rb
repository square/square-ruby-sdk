module Square
  # SnippetsApi
  class SnippetsApi < BaseApi
    def initialize(config, http_call_back: nil)
      super(config, http_call_back: http_call_back)
    end

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
    # @return [DeleteSnippetResponse Hash] response from the API call
    def delete_snippet(site_id:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/sites/{site_id}/snippet'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'site_id' => { 'value' => site_id, 'encode' => true }
      )
      _query_url = APIHelper.clean_url _query_builder

      # Prepare headers.
      _headers = {
        'accept' => 'application/json'
      }

      # Prepare and execute HttpRequest.
      _request = config.http_client.delete(
        _query_url,
        headers: _headers
      )
      OAuth2.apply(config, _request)
      _response = execute_request(_request)

      # Return appropriate response type.
      decoded = APIHelper.json_deserialize(_response.raw_body)
      _errors = APIHelper.map_response(decoded, ['errors'])
      ApiResponse.new(
        _response, data: decoded, errors: _errors
      )
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
    # @return [RetrieveSnippetResponse Hash] response from the API call
    def retrieve_snippet(site_id:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/sites/{site_id}/snippet'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'site_id' => { 'value' => site_id, 'encode' => true }
      )
      _query_url = APIHelper.clean_url _query_builder

      # Prepare headers.
      _headers = {
        'accept' => 'application/json'
      }

      # Prepare and execute HttpRequest.
      _request = config.http_client.get(
        _query_url,
        headers: _headers
      )
      OAuth2.apply(config, _request)
      _response = execute_request(_request)

      # Return appropriate response type.
      decoded = APIHelper.json_deserialize(_response.raw_body)
      _errors = APIHelper.map_response(decoded, ['errors'])
      ApiResponse.new(
        _response, data: decoded, errors: _errors
      )
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
    # @return [UpsertSnippetResponse Hash] response from the API call
    def upsert_snippet(site_id:,
                       body:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/sites/{site_id}/snippet'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'site_id' => { 'value' => site_id, 'encode' => true }
      )
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
      ApiResponse.new(
        _response, data: decoded, errors: _errors
      )
    end
  end
end
