# frozen_string_literal: true

require_relative "wire_helper"
require "net/http"
require "json"
require "uri"
require "square"

class InvoicesWireTest < Minitest::Test
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

  def test_invoices_list_with_wiremock
    test_id = "invoices.list.0"

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.invoices.list(
      location_id: "location_id",
      cursor: "cursor",
      limit: 1,
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "invoices.list.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/v2/invoices",
      query_params: { "location_id" => "location_id" },
      expected: 1
    )
  end

  def test_invoices_create_with_wiremock
    test_id = "invoices.create.0"

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.invoices.create(
      invoice: {
        location_id: "ES0RJRZYEC39A",
        order_id: "CAISENgvlJ6jLWAzERDzjyHVybY",
        primary_recipient: {
          customer_id: "JDKYHBWT1D4F8MFH63DBMEN8Y4"
        },
        payment_requests: [{
          request_type: "BALANCE",
          due_date: "2030-01-24",
          tipping_enabled: true,
          automatic_payment_source: "NONE",
          reminders: [{
            relative_scheduled_days: -1,
            message: "Your invoice is due tomorrow"
          }]
        }],
        delivery_method: "EMAIL",
        invoice_number: "inv-100",
        title: "Event Planning Services",
        description: "We appreciate your business!",
        scheduled_at: "2030-01-13T10:00:00Z",
        accepted_payment_methods: {
          card: true,
          square_gift_card: false,
          bank_account: false,
          buy_now_pay_later: false,
          cash_app_pay: false
        },
        custom_fields: [{
          label: "Event Reference Number",
          value: "Ref. #1234",
          placement: "ABOVE_LINE_ITEMS"
        }, {
          label: "Terms of Service",
          value: "The terms of service are...",
          placement: "BELOW_LINE_ITEMS"
        }],
        sale_or_service_date: "2030-01-24",
        store_payment_method_enabled: false
      },
      idempotency_key: "ce3748f9-5fc1-4762-aa12-aae5e843f1f4",
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "invoices.create.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v2/invoices",
      query_params: nil,
      expected: 1
    )
  end

  def test_invoices_search_with_wiremock
    test_id = "invoices.search.0"

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.invoices.search(
      query: {
        filter: {
          location_ids: ["ES0RJRZYEC39A"],
          customer_ids: ["JDKYHBWT1D4F8MFH63DBMEN8Y4"]
        },
        sort: {
          field: "INVOICE_SORT_DATE",
          order: "DESC"
        }
      },
      limit: 100,
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "invoices.search.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v2/invoices/search",
      query_params: nil,
      expected: 1
    )
  end

  def test_invoices_get_with_wiremock
    test_id = "invoices.get.0"

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.invoices.get(
      invoice_id: "invoice_id",
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "invoices.get.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/v2/invoices/invoice_id",
      query_params: nil,
      expected: 1
    )
  end

  def test_invoices_update_with_wiremock
    test_id = "invoices.update.0"

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.invoices.update(
      invoice_id: "invoice_id",
      invoice: {
        version: 1,
        payment_requests: [{
          uid: "2da7964f-f3d2-4f43-81e8-5aa220bf3355",
          tipping_enabled: false
        }]
      },
      idempotency_key: "4ee82288-0910-499e-ab4c-5d0071dad1be",
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "invoices.update.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "PUT",
      url_path: "/v2/invoices/invoice_id",
      query_params: nil,
      expected: 1
    )
  end

  def test_invoices_delete_with_wiremock
    test_id = "invoices.delete.0"

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.invoices.delete(
      invoice_id: "invoice_id",
      version: 1,
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "invoices.delete.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "DELETE",
      url_path: "/v2/invoices/invoice_id",
      query_params: nil,
      expected: 1
    )
  end

  def test_invoices_create_invoice_attachment_with_wiremock
    test_id = "invoices.create_invoice_attachment.0"

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.invoices.create_invoice_attachment(
      invoice_id: "invoice_id",
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "invoices.create_invoice_attachment.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v2/invoices/invoice_id/attachments",
      query_params: nil,
      expected: 1
    )
  end

  def test_invoices_delete_invoice_attachment_with_wiremock
    test_id = "invoices.delete_invoice_attachment.0"

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.invoices.delete_invoice_attachment(
      invoice_id: "invoice_id",
      attachment_id: "attachment_id",
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "invoices.delete_invoice_attachment.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "DELETE",
      url_path: "/v2/invoices/invoice_id/attachments/attachment_id",
      query_params: nil,
      expected: 1
    )
  end

  def test_invoices_cancel_with_wiremock
    test_id = "invoices.cancel.0"

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.invoices.cancel(
      invoice_id: "invoice_id",
      version: 0,
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "invoices.cancel.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v2/invoices/invoice_id/cancel",
      query_params: nil,
      expected: 1
    )
  end

  def test_invoices_publish_with_wiremock
    test_id = "invoices.publish.0"

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.invoices.publish(
      invoice_id: "invoice_id",
      version: 1,
      idempotency_key: "32da42d0-1997-41b0-826b-f09464fc2c2e",
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "invoices.publish.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v2/invoices/invoice_id/publish",
      query_params: nil,
      expected: 1
    )
  end
end
