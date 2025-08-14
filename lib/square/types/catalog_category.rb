# frozen_string_literal: true

module Square
    module Types
        # A category to which a `CatalogItem` instance belongs.
        class CatalogCategory < Internal::Types::Model
            field :name, String, optional: true, nullable: false
            field :image_ids, Internal::Types::Array[String], optional: true, nullable: false
            field :category_type, Square::CatalogCategoryType, optional: true, nullable: false
            field :parent_category, Square::CatalogObjectCategory, optional: true, nullable: false
            field :is_top_level, Internal::Types::Boolean, optional: true, nullable: false
            field :channels, Internal::Types::Array[String], optional: true, nullable: false
            field :availability_period_ids, Internal::Types::Array[String], optional: true, nullable: false
            field :online_visibility, Internal::Types::Boolean, optional: true, nullable: false
            field :root_category, String, optional: true, nullable: false
            field :ecom_seo_data, Square::CatalogEcomSeoData, optional: true, nullable: false
            field :path_to_root, Internal::Types::Array[Square::CategoryPathToRootNode], optional: true, nullable: false
        end
    end
end
