# frozen_string_literal: true

module Square
  module Types
    class CatalogObjectModifierList < Internal::Types::Model

      # Manual Forward Declarations
      class Square::Types::CatalogModifierList < Internal::Types::Model; end
      class Square::Types::CatalogCustomAttributeValue < Internal::Types::Model; end
      class Square::Types::CatalogV1Id < Internal::Types::Model; end

      field :type, String, optional: false, nullable: false
      field :modifier_list_data, Square::Types::CatalogModifierList, optional: true, nullable: false
      field :id, String, optional: false, nullable: false
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
