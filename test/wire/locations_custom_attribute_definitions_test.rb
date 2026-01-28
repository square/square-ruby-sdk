# frozen_string_literal: true

require_relative "wiremock_test_case"

class LocationsCustomAttributeDefinitionsWireTest < WireMockTestCase
  def setup
    super

    @client = Square::Client.new(
      token: "<token>",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_locations_custom_attribute_definitions_list_with_wiremock
    test_id = "locations.custom_attribute_definitions.list.0"

    result = @client.locations.custom_attribute_definitions.list(
      visibility_filter: "ALL",
      limit: 1,
      cursor: "cursor",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "locations.custom_attribute_definitions.list.0"
        }
      }
    )

    result.pages.next_page

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/v2/locations/custom-attribute-definitions",
      query_params: nil,
      expected: 1
    )
  end

  def test_locations_custom_attribute_definitions_create_with_wiremock
    test_id = "locations.custom_attribute_definitions.create.0"

    @client.locations.custom_attribute_definitions.create(
      custom_attribute_definition: {
        key: "bestseller",
        schema: {},
        name: "Bestseller",
        description: "Bestselling item at location",
        visibility: "VISIBILITY_READ_WRITE_VALUES"
      },
      request_options: {
        additional_headers: {
          "X-Test-Id" => "locations.custom_attribute_definitions.create.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v2/locations/custom-attribute-definitions",
      query_params: nil,
      expected: 1
    )
  end

  def test_locations_custom_attribute_definitions_get_with_wiremock
    test_id = "locations.custom_attribute_definitions.get.0"

    @client.locations.custom_attribute_definitions.get(
      key: "key",
      version: 1,
      request_options: {
        additional_headers: {
          "X-Test-Id" => "locations.custom_attribute_definitions.get.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/v2/locations/custom-attribute-definitions/key",
      query_params: nil,
      expected: 1
    )
  end

  def test_locations_custom_attribute_definitions_update_with_wiremock
    test_id = "locations.custom_attribute_definitions.update.0"

    @client.locations.custom_attribute_definitions.update(
      key: "key",
      custom_attribute_definition: {
        description: "Update the description as desired.",
        visibility: "VISIBILITY_READ_ONLY"
      },
      request_options: {
        additional_headers: {
          "X-Test-Id" => "locations.custom_attribute_definitions.update.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "PUT",
      url_path: "/v2/locations/custom-attribute-definitions/key",
      query_params: nil,
      expected: 1
    )
  end

  def test_locations_custom_attribute_definitions_delete_with_wiremock
    test_id = "locations.custom_attribute_definitions.delete.0"

    @client.locations.custom_attribute_definitions.delete(
      key: "key",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "locations.custom_attribute_definitions.delete.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "DELETE",
      url_path: "/v2/locations/custom-attribute-definitions/key",
      query_params: nil,
      expected: 1
    )
  end
end
