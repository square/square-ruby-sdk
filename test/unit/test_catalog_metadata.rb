# frozen_string_literal: true

require "test_helper"
require "webmock/minitest"

class CatalogMetadataRegressionTest < Minitest::Test
  def setup
    @client = Square::Client.new(token: "test-token", base_url: "https://square.example.test")
  end

  def test_catalog_first_page_makes_exactly_one_request_and_loads_nested_metadata
    objects = [{
      type: "ITEM", id: "ITEM", version: 1, is_deleted: false,
      item_data: { name: "Coffee", variations: [{
        type: "ITEM_VARIATION", id: "VARIATION", version: 2,
        item_variation_data: { name: "Regular" }
      }] }
    }]
    stub = stub_request(:get, "https://square.example.test/v2/catalog/list")
           .with(query: hash_including("types" => "ITEM,ITEM_VARIATION"))
           .to_return(status: 200, body: JSON.generate(cursor: "NEXT", objects: objects))

    iterator = @client.catalog.list(types: "ITEM,ITEM_VARIATION")

    assert_not_requested stub
    page = iterator.pages.next_page

    assert_equal 1, page.objects.size
    assert_same false, page.objects.first.is_deleted
    assert_equal 2, page.objects.first.item_data.variations.first.version
    assert_requested stub, times: 1
  end
end
