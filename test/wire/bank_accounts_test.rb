# frozen_string_literal: true

require_relative "wire_helper"
require "net/http"
require "json"
require "uri"
require "square"

class BankAccountsWireTest < Minitest::Test
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

  def test_bank_accounts_list_with_wiremock
    test_id = "bank_accounts.list.0"

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.bank_accounts.list(
      cursor: "cursor",
      limit: 1,
      location_id: "location_id",
      customer_id: "customer_id",
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "bank_accounts.list.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/v2/bank-accounts",
      query_params: nil,
      expected: 1
    )
  end

  def test_bank_accounts_create_bank_account_with_wiremock
    test_id = "bank_accounts.create_bank_account.0"

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.bank_accounts.create_bank_account(
      idempotency_key: "4e43559a-f0fd-47d3-9da2-7ea1f97d94be",
      source_id: "bnon:CA4SEHsQwr0rx6DbWLD5BQaqMnoYAQ",
      customer_id: "HM3B2D5JKGZ69359BTEHXM2V8M",
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "bank_accounts.create_bank_account.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v2/bank-accounts",
      query_params: nil,
      expected: 1
    )
  end

  def test_bank_accounts_get_by_v_1_id_with_wiremock
    test_id = "bank_accounts.get_by_v_1_id.0"

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.bank_accounts.get_by_v_1_id(
      v_1_bank_account_id: "v1_bank_account_id",
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "bank_accounts.get_by_v_1_id.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/v2/bank-accounts/by-v1-id/v1_bank_account_id",
      query_params: nil,
      expected: 1
    )
  end

  def test_bank_accounts_get_with_wiremock
    test_id = "bank_accounts.get.0"

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.bank_accounts.get(
      bank_account_id: "bank_account_id",
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "bank_accounts.get.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/v2/bank-accounts/bank_account_id",
      query_params: nil,
      expected: 1
    )
  end

  def test_bank_accounts_disable_bank_account_with_wiremock
    test_id = "bank_accounts.disable_bank_account.0"

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.bank_accounts.disable_bank_account(
      bank_account_id: "bank_account_id",
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "bank_accounts.disable_bank_account.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v2/bank-accounts/bank_account_id/disable",
      query_params: nil,
      expected: 1
    )
  end
end
