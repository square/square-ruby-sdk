# frozen_string_literal: true

module Square
    module Types
        class CatalogObjectItemOption < Square::Internal::Types::Model
            field :type, String, optional: false, nullable: false
            field :item_option_data, Square::CatalogItemOption, optional: true, nullable: false
            field :id, String, optional: false, nullable: false
            field :updated_at, String, optional: true, nullable: false
            field :version, Integer, optional: true, nullable: false
            field :is_deleted, Square::Internal::Types::Boolean, optional: true, nullable: false
            field :custom_attribute_values, Square::Internal::Types::Hash[String, Square::CatalogCustomAttributeValue], optional: true, nullable: false
            field :catalog_v_1_ids, Square::Internal::Types::Array[Square::CatalogV1Id], optional: true, nullable: false
            field :present_at_all_locations, Square::Internal::Types::Boolean, optional: true, nullable: false
            field :present_at_location_ids, Square::Internal::Types::Array[String], optional: true, nullable: false
            field :absent_at_location_ids, Square::Internal::Types::Array[String], optional: true, nullable: false
            field :image_id, String, optional: true, nullable: false
        end
    end
end
