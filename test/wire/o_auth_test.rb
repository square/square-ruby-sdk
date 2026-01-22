# frozen_string_literal: true

require_relative "wire_helper"
require "net/http"
require "json"
require "uri"
require "square"

class OAuthWireTest < Minitest::Test
  WIREMOCK_BASE_URL = "http://localhost:8080"
  WIREMOCK_ADMIN_URL = "http://localhost:8080/__admin"

  def setup
    super
    return if ENV["RUN_WIRE_TESTS"] == "true"

    skip "Wire tests are disabled by default. Set RUN_WIRE_TESTS=true to enable them."
  end

  def verify_request_count(test_id:, method:, url_path:, expected:, query_params: nil)
    uri = URI("#{WIREMOCK_ADMIN_URL}/requests/find")
    http = Net::HTTP.new(uri.host, uri.port)
    post_request = Net::HTTP::Post.new(uri.path, { "Content-Type" => "application/json" })

    request_body = { "method" => method, "urlPath" => url_path }
    request_body["headers"] = { "X-Test-Id" => { "equalTo" => test_id } }
    request_body["queryParameters"] = query_params.transform_values { |v| { "equalTo" => v } } if query_params

    post_request.body = request_body.to_json
    response = http.request(post_request)
    result = JSON.parse(response.body)
    requests = result["requests"] || []

    assert_equal expected, requests.length, "Expected #{expected} requests, found #{requests.length}"
  end

  def test_o_auth_revoke_token_with_wiremock
    test_id = "o_auth.revoke_token.0"

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.o_auth.revoke_token(
      client_id: "CLIENT_ID",
      access_token: "ACCESS_TOKEN",
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "o_auth.revoke_token.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/oauth2/revoke",
      query_params: nil,
      expected: 1
    )
  end

  def test_o_auth_obtain_token_with_wiremock
    test_id = "o_auth.obtain_token.0"

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.o_auth.obtain_token(
      client_id: "sq0idp-uaPHILoPzWZk3tlJqlML0g",
      client_secret: "sq0csp-30a-4C_tVOnTh14Piza2BfTPBXyLafLPWSzY1qAjeBfM",
      code: "sq0cgb-l0SBqxs4uwxErTVyYOdemg",
      grant_type: "authorization_code",
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "o_auth.obtain_token.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/oauth2/token",
      query_params: nil,
      expected: 1
    )
  end

  def test_o_auth_retrieve_token_status_with_wiremock
    test_id = "o_auth.retrieve_token_status.0"

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.o_auth.retrieve_token_status(request_options: { base_url: WIREMOCK_BASE_URL,
                                                           additional_headers: {
                                                             "X-Test-Id" => "o_auth.retrieve_token_status.0"
                                                           } })

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/oauth2/token/status",
      query_params: nil,
      expected: 1
    )
  end

  def test_o_auth_authorize_with_wiremock
    test_id = "o_auth.authorize.0"

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.o_auth.authorize(request_options: { base_url: WIREMOCK_BASE_URL,
                                               additional_headers: {
                                                 "X-Test-Id" => "o_auth.authorize.0"
                                               } })

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/oauth2/authorize",
      query_params: nil,
      expected: 1
    )
  end
end
