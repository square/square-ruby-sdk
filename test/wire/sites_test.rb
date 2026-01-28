# frozen_string_literal: true

require_relative "wiremock_test_case"

class SitesWireTest < WireMockTestCase
  def setup
    super

    @client = Square::Client.new(
      token: "<token>",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_sites_list_with_wiremock
    test_id = "sites.list.0"

    @client.sites.list(request_options: {
                         additional_headers: {
                           "X-Test-Id" => "sites.list.0"
                         }
                       })

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/v2/sites",
      query_params: nil,
      expected: 1
    )
  end
end
