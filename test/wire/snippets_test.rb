# frozen_string_literal: true

require_relative "wiremock_test_case"

class SnippetsWireTest < WireMockTestCase
  def setup
    super

    @client = Square::Client.new(
      token: "<token>",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_snippets_get_with_wiremock
    test_id = "snippets.get.0"

    @client.snippets.get(
      site_id: "site_id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "snippets.get.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/v2/sites/site_id/snippet",
      query_params: nil,
      expected: 1
    )
  end

  def test_snippets_upsert_with_wiremock
    test_id = "snippets.upsert.0"

    @client.snippets.upsert(
      site_id: "site_id",
      snippet: {
        content: "<script>var js = 1;</script>"
      },
      request_options: {
        additional_headers: {
          "X-Test-Id" => "snippets.upsert.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v2/sites/site_id/snippet",
      query_params: nil,
      expected: 1
    )
  end

  def test_snippets_delete_with_wiremock
    test_id = "snippets.delete.0"

    @client.snippets.delete(
      site_id: "site_id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "snippets.delete.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "DELETE",
      url_path: "/v2/sites/site_id/snippet",
      query_params: nil,
      expected: 1
    )
  end
end
