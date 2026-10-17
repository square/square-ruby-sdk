# frozen_string_literal: true

require "test_helper"
require "webmock/minitest"

class PaymentTimeSerializationTest < Minitest::Test
  def test_payments_list_sends_rfc3339_query_values
    client = Square::Client.new(token: "test-token", base_url: "https://square.example.test")
    stub = stub_request(:get, "https://square.example.test/v2/payments")
           .with(query: hash_including(
             "begin_time" => "2026-09-01T00:00:00.000Z",
             "end_time" => "2026-09-02T00:00:00.000Z"
           ))
           .to_return(status: 200, body: '{"payments":[]}')

    page = client.payments.list(begin_time: Time.utc(2026, 9, 1), end_time: Time.utc(2026, 9, 2)).pages.next_page

    assert_empty page.payments
    assert_requested stub, times: 1
  end
end
