# frozen_string_literal: true

require_relative "wiremock_test_case"

class ReportingWireTest < WireMockTestCase
  def setup
    super

    @client = Square::Client.new(
      token: "<token>",
      base_url: WIREMOCK_BASE_URL,
      max_retries: 0
    )
  end

  def test_reporting_get_metadata_with_wiremock
    test_id = "reporting.get_metadata.0"

    @client.reporting.get_metadata(request_options: {
      additional_headers: {
        "X-Test-Id" => "reporting.get_metadata.0"
      }
    })

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/reporting/v1/meta",
      query_params: nil,
      expected: 1
    )
  end

  def test_reporting_get_metadata_throws_client_request_error_with_wiremock
    test_id = "reporting.get_metadata.1"

    error = assert_raises(Square::Errors::ClientError) do
      @client.reporting.get_metadata(request_options: {
        additional_headers: {
          "X-Test-Id" => "reporting.get_metadata.1"
        }
      })
    end

    assert_equal 400, error.code
    assert_equal JSON.parse('{"error":"error"}'), JSON.parse(error.message)

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/reporting/v1/meta",
      query_params: nil,
      expected: 1
    )
  end

  def test_reporting_get_metadata_throws_server_error_with_wiremock
    test_id = "reporting.get_metadata.2"

    error = assert_raises(Square::Errors::ServerError) do
      @client.reporting.get_metadata(request_options: {
        additional_headers: {
          "X-Test-Id" => "reporting.get_metadata.2"
        }
      })
    end

    assert_equal 500, error.code
    assert_equal JSON.parse('{"error":"error"}'), JSON.parse(error.message)

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/reporting/v1/meta",
      query_params: nil,
      expected: 1
    )
  end

  def test_reporting_load_with_wiremock
    test_id = "reporting.load.0"

    @client.reporting.load(request_options: {
      additional_headers: {
        "X-Test-Id" => "reporting.load.0"
      }
    })

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/reporting/v1/load",
      query_params: nil,
      expected: 1
    )
  end

  def test_reporting_load_throws_client_request_error_with_wiremock
    test_id = "reporting.load.1"

    error = assert_raises(Square::Errors::ClientError) do
      @client.reporting.load(request_options: {
        additional_headers: {
          "X-Test-Id" => "reporting.load.1"
        }
      })
    end

    assert_equal 400, error.code
    assert_equal JSON.parse('{"error":"error"}'), JSON.parse(error.message)

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/reporting/v1/load",
      query_params: nil,
      expected: 1
    )
  end

  def test_reporting_load_throws_server_error_with_wiremock
    test_id = "reporting.load.2"

    error = assert_raises(Square::Errors::ServerError) do
      @client.reporting.load(request_options: {
        additional_headers: {
          "X-Test-Id" => "reporting.load.2"
        }
      })
    end

    assert_equal 500, error.code
    assert_equal JSON.parse('{"error":"error"}'), JSON.parse(error.message)

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/reporting/v1/load",
      query_params: nil,
      expected: 1
    )
  end
end
