# frozen_string_literal: true

require_relative "wire_helper"
require "net/http"
require "json"
require "uri"
require "square"

class SubscriptionsWireTest < Minitest::Test
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

  def test_subscriptions_create_with_wiremock
    test_id = "subscriptions.create.0"

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.subscriptions.create(
      idempotency_key: "8193148c-9586-11e6-99f9-28cfe92138cf",
      location_id: "S8GWD5R9QB376",
      plan_variation_id: "6JHXF3B2CW3YKHDV4XEM674H",
      customer_id: "CHFGVKYY8RSV93M5KCYTG4PN0G",
      start_date: "2023-06-20",
      card_id: "ccof:qy5x8hHGYsgLrp4Q4GB",
      timezone: "America/Los_Angeles",
      source: {
        name: "My Application"
      },
      phases: [{
        ordinal: 0,
        order_template_id: "U2NaowWxzXwpsZU697x7ZHOAnCNZY"
      }],
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "subscriptions.create.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v2/subscriptions",
      query_params: nil,
      expected: 1
    )
  end

  def test_subscriptions_bulk_swap_plan_with_wiremock
    test_id = "subscriptions.bulk_swap_plan.0"

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.subscriptions.bulk_swap_plan(
      new_plan_variation_id: "FQ7CDXXWSLUJRPM3GFJSJGZ7",
      old_plan_variation_id: "6JHXF3B2CW3YKHDV4XEM674H",
      location_id: "S8GWD5R9QB376",
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "subscriptions.bulk_swap_plan.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v2/subscriptions/bulk-swap-plan",
      query_params: nil,
      expected: 1
    )
  end

  def test_subscriptions_search_with_wiremock
    test_id = "subscriptions.search.0"

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.subscriptions.search(
      query: {
        filter: {
          customer_ids: ["CHFGVKYY8RSV93M5KCYTG4PN0G"],
          location_ids: ["S8GWD5R9QB376"],
          source_names: ["My App"]
        }
      },
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "subscriptions.search.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v2/subscriptions/search",
      query_params: nil,
      expected: 1
    )
  end

  def test_subscriptions_get_with_wiremock
    test_id = "subscriptions.get.0"

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.subscriptions.get(
      subscription_id: "subscription_id",
      include: "include",
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "subscriptions.get.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/v2/subscriptions/subscription_id",
      query_params: nil,
      expected: 1
    )
  end

  def test_subscriptions_update_with_wiremock
    test_id = "subscriptions.update.0"

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.subscriptions.update(
      subscription_id: "subscription_id",
      subscription: {
        card_id: "{NEW CARD ID}"
      },
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "subscriptions.update.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "PUT",
      url_path: "/v2/subscriptions/subscription_id",
      query_params: nil,
      expected: 1
    )
  end

  def test_subscriptions_delete_action_with_wiremock
    test_id = "subscriptions.delete_action.0"

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.subscriptions.delete_action(
      subscription_id: "subscription_id",
      action_id: "action_id",
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "subscriptions.delete_action.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "DELETE",
      url_path: "/v2/subscriptions/subscription_id/actions/action_id",
      query_params: nil,
      expected: 1
    )
  end

  def test_subscriptions_change_billing_anchor_date_with_wiremock
    test_id = "subscriptions.change_billing_anchor_date.0"

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.subscriptions.change_billing_anchor_date(
      subscription_id: "subscription_id",
      monthly_billing_anchor_date: 1,
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "subscriptions.change_billing_anchor_date.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v2/subscriptions/subscription_id/billing-anchor",
      query_params: nil,
      expected: 1
    )
  end

  def test_subscriptions_cancel_with_wiremock
    test_id = "subscriptions.cancel.0"

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.subscriptions.cancel(
      subscription_id: "subscription_id",
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "subscriptions.cancel.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v2/subscriptions/subscription_id/cancel",
      query_params: nil,
      expected: 1
    )
  end

  def test_subscriptions_list_events_with_wiremock
    test_id = "subscriptions.list_events.0"

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.subscriptions.list_events(
      subscription_id: "subscription_id",
      cursor: "cursor",
      limit: 1,
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "subscriptions.list_events.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/v2/subscriptions/subscription_id/events",
      query_params: nil,
      expected: 1
    )
  end

  def test_subscriptions_pause_with_wiremock
    test_id = "subscriptions.pause.0"

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.subscriptions.pause(
      subscription_id: "subscription_id",
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "subscriptions.pause.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v2/subscriptions/subscription_id/pause",
      query_params: nil,
      expected: 1
    )
  end

  def test_subscriptions_resume_with_wiremock
    test_id = "subscriptions.resume.0"

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.subscriptions.resume(
      subscription_id: "subscription_id",
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "subscriptions.resume.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v2/subscriptions/subscription_id/resume",
      query_params: nil,
      expected: 1
    )
  end

  def test_subscriptions_swap_plan_with_wiremock
    test_id = "subscriptions.swap_plan.0"

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.subscriptions.swap_plan(
      subscription_id: "subscription_id",
      new_plan_variation_id: "FQ7CDXXWSLUJRPM3GFJSJGZ7",
      phases: [{
        ordinal: 0,
        order_template_id: "uhhnjH9osVv3shUADwaC0b3hNxQZY"
      }],
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "subscriptions.swap_plan.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v2/subscriptions/subscription_id/swap-plan",
      query_params: nil,
      expected: 1
    )
  end
end
