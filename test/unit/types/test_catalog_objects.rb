# frozen_string_literal: true

require "test_helper"

describe Square::Types::CatalogObject do
  Square::Types::CatalogObject.members.each do |type, member|
    klass = member.call

    it "exposes shared fields on #{klass.name} even when absent from the response" do
      object = klass.new(id: "OBJECT")

      assert_kind_of Square::Types::CatalogObjectBase, object
      Square::Types::CatalogObjectBase.fields.each_key do |field|
        assert_respond_to object, field
        assert_respond_to object, :"#{field}="
      end
      assert_nil object.present_at_location_ids
      object.present_at_location_ids = ["LOCATION"]

      assert_equal ["LOCATION"], object.to_h["present_at_location_ids"]
    end

    it "loads and round-trips shared fields for #{type}" do
      input = {
        type: type, id: "OBJECT", version: 123, is_deleted: false,
        present_at_all_locations: false, present_at_location_ids: ["LOCATION"],
        absent_at_location_ids: ["OTHER"], catalog_v1_ids: [{ catalog_v1_id: "V1" }],
        custom_attribute_values: { key: { name: "Attribute", string_value: "value" } }
      }
      object = Square::Types::CatalogObject.load(JSON.generate(input))

      assert_instance_of klass, object
      assert_equal 123, object.version
      assert_same false, object.is_deleted
      assert_same false, object.present_at_all_locations
      assert_equal ["LOCATION"], object.present_at_location_ids
      assert_kind_of Square::Types::CatalogV1Id, object.catalog_v_1_ids.first
      assert_kind_of Square::Types::CatalogCustomAttributeValue, object.custom_attribute_values["key"]
      assert_equal input, JSON.parse(JSON.generate(object.to_h), symbolize_names: true)
    end
  end

  it "loads metadata on variations nested inside items" do
    objects = [{
      type: "ITEM", id: "ITEM", item_data: { variations: [{
        type: "ITEM_VARIATION", id: "VARIATION", version: 42,
        item_variation_data: { name: "Regular" }
      }] }
    }]
    response = Square::Types::ListCatalogResponse.load(JSON.generate(objects: objects))
    variation = response.objects.first.item_data.variations.first

    assert_kind_of Square::Types::CatalogObjectBase, variation
    assert_equal 42, variation.version
    assert_nil variation.present_at_location_ids
    assert_equal "Regular", variation.item_variation_data.name
  end
end
