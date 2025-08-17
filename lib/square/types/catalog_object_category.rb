# frozen_string_literal: true

module Square
  module Types
    # A category that can be assigned to an item or a parent category that can be assigned 
    # to another category. For example, a clothing category can be assigned to a t-shirt item or 
    # be made as the parent category to the pants category.
    class CatalogObjectCategory < Internal::Types::Model
      field :id, String, optional: true, nullable: false
      field :ordinal, Integer, optional: true, nullable: false
      field :type, String, optional: false, nullable: false
      field :category_data, Square::Types::CatalogCategory, optional: true, nullable: false
      field :updated_at, String, optional: true, nullable: false
      field :version, Integer, optional: true, nullable: false
      field :is_deleted, Internal::Types::Boolean, optional: true, nullable: false
      field :custom_attribute_values, Internal::Types::Hash[String, Square::Types::CatalogCustomAttributeValue], optional: true, nullable: false
      field :catalog_v_1_ids, Internal::Types::Array[Square::Types::CatalogV1Id], optional: true, nullable: false
      field :present_at_all_locations, Internal::Types::Boolean, optional: true, nullable: false
      field :present_at_location_ids, Internal::Types::Array[String], optional: true, nullable: false
      field :absent_at_location_ids, Internal::Types::Array[String], optional: true, nullable: false
      field :image_id, String, optional: true, nullable: false

    end
  end
end
