# frozen_string_literal: true

require_relative "wiremock_test_case"

class LocationsCustomAttributesWireTest < WireMockTestCase
  def setup
    super

    @client = Square::Client.new(
      token: "<token>",
      base_url: WIREMOCK_BASE_URL,
      max_retries: 0
    )
  end

  def test_locations_custom_attributes_batch_delete_with_wiremock
    test_id = "locations.custom_attributes.batch_delete.0"

    @client.locations.custom_attributes.batch_delete(
      values: {
        id1: {
          key: "bestseller"
        },
        id2: {
          key: "bestseller"
        },
        id3: {
          key: "phone-number"
        }
      },
      request_options: {
        additional_headers: {
          "X-Test-Id" => "locations.custom_attributes.batch_delete.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v2/locations/custom-attributes/bulk-delete",
      query_params: nil,
      expected: 1
    )
  end

  def test_locations_custom_attributes_batch_upsert_with_wiremock
    test_id = "locations.custom_attributes.batch_upsert.0"

    result = @client.locations.custom_attributes.batch_upsert(
      values: {
        id1: {
          location_id: "L0TBCBTB7P8RQ",
          custom_attribute: {
            key: "bestseller",
            value: "hot cocoa"
          }
        },
        id2: {
          location_id: "L9XMD04V3STJX",
          custom_attribute: {
            key: "bestseller",
            value: "berry smoothie"
          }
        },
        id3: {
          location_id: "L0TBCBTB7P8RQ",
          custom_attribute: {
            key: "phone-number",
            value: "+12223334444"
          }
        }
      },
      request_options: {
        additional_headers: {
          "X-Test-Id" => "locations.custom_attributes.batch_upsert.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v2/locations/custom-attributes/bulk-upsert",
      query_params: nil,
      expected: 1
    )

    verify_response_numbers(
      actual: result,
      expected: {
        "/values/id1/custom_attribute/version" => 2,
        "/values/id2/custom_attribute/version" => 1,
        "/values/id3/custom_attribute/version" => 2
      }
    )
  end

  def test_locations_custom_attributes_list_with_wiremock
    test_id = "locations.custom_attributes.list.0"

    result = @client.locations.custom_attributes.list(
      location_id: "location_id",
      visibility_filter: "ALL",
      limit: 1,
      cursor: "cursor",
      with_definitions: true,
      request_options: {
        additional_headers: {
          "X-Test-Id" => "locations.custom_attributes.list.0"
        }
      }
    )
    result.pages.next_page

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/v2/locations/location_id/custom-attributes",
      query_params: nil,
      expected: 1
    )
  end

  def test_locations_custom_attributes_get_with_wiremock
    test_id = "locations.custom_attributes.get.0"

    result = @client.locations.custom_attributes.get(
      location_id: "location_id",
      key: "key",
      with_definition: true,
      version: 1,
      request_options: {
        additional_headers: {
          "X-Test-Id" => "locations.custom_attributes.get.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/v2/locations/location_id/custom-attributes/key",
      query_params: nil,
      expected: 1
    )

    verify_response_numbers(
      actual: result,
      expected: {
        "/custom_attribute/version" => 2,
        "/custom_attribute/definition/version" => 1
      }
    )
  end

  def test_locations_custom_attributes_upsert_with_wiremock
    test_id = "locations.custom_attributes.upsert.0"

    result = @client.locations.custom_attributes.upsert(
      location_id: "location_id",
      key: "key",
      custom_attribute: {
        value: "hot cocoa"
      },
      request_options: {
        additional_headers: {
          "X-Test-Id" => "locations.custom_attributes.upsert.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v2/locations/location_id/custom-attributes/key",
      query_params: nil,
      expected: 1
    )

    verify_response_numbers(
      actual: result,
      expected: {
        "/custom_attribute/version" => 2,
        "/custom_attribute/definition/version" => 1
      }
    )
  end

  def test_locations_custom_attributes_delete_with_wiremock
    test_id = "locations.custom_attributes.delete.0"

    @client.locations.custom_attributes.delete(
      location_id: "location_id",
      key: "key",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "locations.custom_attributes.delete.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "DELETE",
      url_path: "/v2/locations/location_id/custom-attributes/key",
      query_params: nil,
      expected: 1
    )
  end
end
