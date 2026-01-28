# frozen_string_literal: true

require_relative "wiremock_test_case"

class CatalogImagesWireTest < WireMockTestCase
  def setup
    super

    @client = Square::Client.new(
      token: "<token>",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_catalog_images_create_with_wiremock
    test_id = "catalog.images.create.0"

    @client.catalog.images.create(request_options: {
                                    additional_headers: {
                                      "X-Test-Id" => "catalog.images.create.0"
                                    }
                                  })

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v2/catalog/images",
      query_params: nil,
      expected: 1
    )
  end

  def test_catalog_images_update_with_wiremock
    test_id = "catalog.images.update.0"

    @client.catalog.images.update(
      image_id: "image_id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "catalog.images.update.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "PUT",
      url_path: "/v2/catalog/images/image_id",
      query_params: nil,
      expected: 1
    )
  end
end
