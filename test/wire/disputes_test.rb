# frozen_string_literal: true

require_relative "wire_helper"
require "net/http"
require "json"
require "uri"
require "square"

class DisputesWireTest < Minitest::Test
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

  def test_disputes_list_with_wiremock
    test_id = "disputes.list.0"

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.disputes.list(
      cursor: "cursor",
      states: "INQUIRY_EVIDENCE_REQUIRED",
      location_id: "location_id",
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "disputes.list.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/v2/disputes",
      query_params: nil,
      expected: 1
    )
  end

  def test_disputes_get_with_wiremock
    test_id = "disputes.get.0"

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.disputes.get(
      dispute_id: "dispute_id",
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "disputes.get.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/v2/disputes/dispute_id",
      query_params: nil,
      expected: 1
    )
  end

  def test_disputes_accept_with_wiremock
    test_id = "disputes.accept.0"

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.disputes.accept(
      dispute_id: "dispute_id",
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "disputes.accept.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v2/disputes/dispute_id/accept",
      query_params: nil,
      expected: 1
    )
  end

  def test_disputes_create_evidence_file_with_wiremock
    test_id = "disputes.create_evidence_file.0"

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.disputes.create_evidence_file(
      dispute_id: "dispute_id",
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "disputes.create_evidence_file.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v2/disputes/dispute_id/evidence-files",
      query_params: nil,
      expected: 1
    )
  end

  def test_disputes_create_evidence_text_with_wiremock
    test_id = "disputes.create_evidence_text.0"

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.disputes.create_evidence_text(
      dispute_id: "dispute_id",
      idempotency_key: "ed3ee3933d946f1514d505d173c82648",
      evidence_type: "TRACKING_NUMBER",
      evidence_text: "1Z8888888888888888",
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "disputes.create_evidence_text.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v2/disputes/dispute_id/evidence-text",
      query_params: nil,
      expected: 1
    )
  end

  def test_disputes_submit_evidence_with_wiremock
    test_id = "disputes.submit_evidence.0"

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.disputes.submit_evidence(
      dispute_id: "dispute_id",
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "disputes.submit_evidence.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v2/disputes/dispute_id/submit-evidence",
      query_params: nil,
      expected: 1
    )
  end
end
