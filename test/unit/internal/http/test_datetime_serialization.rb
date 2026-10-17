# frozen_string_literal: true

require "test_helper"
require "date"
require "time"

begin
  require "active_support"
  require "active_support/time"
rescue LoadError
  # ActiveSupport is optional: the SDK must not require Rails at runtime.
end

describe "Request date/time serialization" do
  def request(query: {}, body: nil, request_options: {})
    Square::Internal::JSON::Request.new(
      base_url: nil, path: "v2/payments", method: "GET", query: query,
      body: body, request_options: request_options
    )
  end

  def query_values(request)
    raw_client = Square::Internal::Http::RawClient.new(base_url: "https://example.test")
    URI.decode_www_form(raw_client.build_url(request).query).to_h
  end

  it "encodes Time and DateTime query parameters as RFC3339 with milliseconds and offsets" do
    query = {
      begin_time: Time.new(2026, 9, 1, 12, 34, 56.125, "+05:30"),
      end_time: DateTime.iso8601("2026-09-02T12:34:56.125-04:00")
    }
    values = query_values(request(query: query))

    assert_equal "2026-09-01T12:34:56.125+05:30", values["begin_time"]
    assert_equal "2026-09-02T12:34:56.125-04:00", values["end_time"]
  end

  it "encodes real ActiveSupport::TimeWithZone objects, regardless of Rails JSON settings" do
    skip "Install activesupport to test Rails compatibility" unless defined?(ActiveSupport::TimeZone)

    time = ActiveSupport::TimeZone["Eastern Time (US & Canada)"].parse("2026-09-01 12:34:56.125")
    original = ActiveSupport::JSON::Encoding.use_standard_json_time_format
    begin
      ActiveSupport::JSON::Encoding.use_standard_json_time_format = false
      values = query_values(request(query: { begin_time: time, end_time: time + 3600 }))

      assert_equal "2026-09-01T12:34:56.125-04:00", values["begin_time"]
      assert_equal "2026-09-01T13:34:56.125-04:00", values["end_time"]
      body = JSON.parse(request(body: { begin_time: time }).encode_body)

      assert_equal "2026-09-01T12:34:56.125-04:00", body["begin_time"]
    ensure
      ActiveSupport::JSON::Encoding.use_standard_json_time_format = original
    end
  end

  it "handles additional query parameters and arrays without changing caller data" do
    times = [Time.utc(2026, 9, 1)]
    req = request(query: { begin_time: "unchanged", limit: 10, enabled: false, optional: nil },
                  request_options: { additional_query_parameters: { begin_time: times } })
    raw = Square::Internal::Http::RawClient.new(base_url: "https://example.test")
    pairs = URI.decode_www_form(raw.build_url(req).query)

    assert_includes pairs, ["begin_time", "2026-09-01T00:00:00.000Z"]
    assert_includes pairs, %w[limit 10]
    assert_includes pairs, %w[enabled false]
    assert_includes pairs, ["optional", ""]
    assert_instance_of Time, times.first
    assert_equal "unchanged", req.query[:begin_time]
  end

  it "leaves RFC3339 strings and other primitive query values unchanged" do
    values = query_values(request(query: { begin_time: "2026-09-01T12:34:56.123456Z", enabled: true, limit: 10 }))

    assert_equal "2026-09-01T12:34:56.123456Z", values["begin_time"]
    assert_equal "true", values["enabled"]
    assert_equal "10", values["limit"]
  end

  it "serializes nested JSON timestamps and dates without changing strings or caller data" do
    body = { filter: { begin_time: Time.utc(2026, 9, 1) },
             values: [DateTime.iso8601("2026-09-01T00:00:00Z"), Date.new(2026, 9, 1)],
             end_time: "2026-09-02T00:00:00Z", enabled: false }
    encoded = JSON.parse(request(body: body).encode_body)

    assert_equal "2026-09-01T00:00:00.000Z", encoded["filter"]["begin_time"]
    assert_equal ["2026-09-01T00:00:00.000+00:00", "2026-09-01"], encoded["values"]
    assert_equal body[:end_time], encoded["end_time"]
    assert_same false, encoded["enabled"]
    assert_instance_of Time, body[:filter][:begin_time]
    assert_nil request.encode_body
  end
end
