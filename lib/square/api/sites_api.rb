module Square
  # SitesApi
  class SitesApi < BaseApi
    def initialize(config, http_call_back: nil)
      super(config, http_call_back: http_call_back)
    end

    # Lists the Square Online sites that belong to a seller.
    # __Note:__ Square Online APIs are publicly available as part of an early
    # access program. For more information, see [Early access program for Square
    # Online
    # APIs](https://developer.squareup.com/docs/online-api#early-access-program-
    # for-square-online-apis).
    # @return [ListSitesResponse Hash] response from the API call
    def list_sites
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/sites'
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
  end
end
