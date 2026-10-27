# frozen_string_literal: true

require_relative "wiremock_test_case"

class BookingsCustomAttributesWireTest < WireMockTestCase
  def setup
    super

    @client = Square::Client.new(
      token: "<token>",
      base_url: WIREMOCK_BASE_URL,
      max_retries: 0
    )
  end

  def test_bookings_custom_attributes_batch_delete_with_wiremock
    test_id = "bookings.custom_attributes.batch_delete.0"

    @client.bookings.custom_attributes.batch_delete(
      values: {
        key: {
          booking_id: "booking_id",
          key: "key"
        }
      },
      request_options: {
        additional_headers: {
          "X-Test-Id" => "bookings.custom_attributes.batch_delete.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v2/bookings/custom-attributes/bulk-delete",
      query_params: nil,
      expected: 1
    )
  end

  def test_bookings_custom_attributes_batch_upsert_with_wiremock
    test_id = "bookings.custom_attributes.batch_upsert.0"

    result = @client.bookings.custom_attributes.batch_upsert(
      values: {
        key: {
          booking_id: "booking_id",
          custom_attribute: {}
        }
      },
      request_options: {
        additional_headers: {
          "X-Test-Id" => "bookings.custom_attributes.batch_upsert.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v2/bookings/custom-attributes/bulk-upsert",
      query_params: nil,
      expected: 1
    )

    verify_response_numbers(
      actual: result,
      expected: {
        "/values/id1/custom_attribute/version" => 1,
        "/values/id2/custom_attribute/version" => 2,
        "/values/id3/custom_attribute/version" => 2,
        "/values/id4/custom_attribute/value" => 4,
        "/values/id4/custom_attribute/version" => 1,
        "/values/id5/custom_attribute/version" => 2
      }
    )
  end

  def test_bookings_custom_attributes_list_with_wiremock
    test_id = "bookings.custom_attributes.list.0"

    result = @client.bookings.custom_attributes.list(
      booking_id: "booking_id",
      limit: 1,
      cursor: "cursor",
      with_definitions: true,
      request_options: {
        additional_headers: {
          "X-Test-Id" => "bookings.custom_attributes.list.0"
        }
      }
    )
    result.pages.next_page

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/v2/bookings/booking_id/custom-attributes",
      query_params: nil,
      expected: 1
    )
  end

  def test_bookings_custom_attributes_get_with_wiremock
    test_id = "bookings.custom_attributes.get.0"

    result = @client.bookings.custom_attributes.get(
      booking_id: "booking_id",
      key: "key",
      with_definition: true,
      version: 1,
      request_options: {
        additional_headers: {
          "X-Test-Id" => "bookings.custom_attributes.get.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/v2/bookings/booking_id/custom-attributes/key",
      query_params: nil,
      expected: 1
    )

    verify_response_numbers(
      actual: result,
      expected: {
        "/custom_attribute/version" => 1,
        "/custom_attribute/definition/version" => 1
      }
    )
  end

  def test_bookings_custom_attributes_upsert_with_wiremock
    test_id = "bookings.custom_attributes.upsert.0"

    result = @client.bookings.custom_attributes.upsert(
      booking_id: "booking_id",
      key: "key",
      custom_attribute: {},
      request_options: {
        additional_headers: {
          "X-Test-Id" => "bookings.custom_attributes.upsert.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "PUT",
      url_path: "/v2/bookings/booking_id/custom-attributes/key",
      query_params: nil,
      expected: 1
    )

    verify_response_numbers(
      actual: result,
      expected: {
        "/custom_attribute/version" => 1,
        "/custom_attribute/definition/version" => 1
      }
    )
  end

  def test_bookings_custom_attributes_delete_with_wiremock
    test_id = "bookings.custom_attributes.delete.0"

    @client.bookings.custom_attributes.delete(
      booking_id: "booking_id",
      key: "key",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "bookings.custom_attributes.delete.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "DELETE",
      url_path: "/v2/bookings/booking_id/custom-attributes/key",
      query_params: nil,
      expected: 1
    )
  end
end
