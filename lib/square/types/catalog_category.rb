# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    # A category to which a `CatalogItem` instance belongs.
    class CatalogCategory < Internal::Types::Model
      field :name, -> { String }, optional: true, nullable: true

      field :image_ids, -> { Internal::Types::Array[String] }, optional: true, nullable: true

      field :category_type, -> { Square::Types::CatalogCategoryType }, optional: true, nullable: false

      field :parent_category, -> { Square::Types::CatalogObjectCategory }, optional: true, nullable: false

      field :is_top_level, -> { Internal::Types::Boolean }, optional: true, nullable: true

      field :channels, -> { Internal::Types::Array[String] }, optional: true, nullable: true

      field :availability_period_ids, -> { Internal::Types::Array[String] }, optional: true, nullable: true

      field :online_visibility, -> { Internal::Types::Boolean }, optional: true, nullable: true

      field :root_category, -> { String }, optional: true, nullable: false

      field :ecom_seo_data, -> { Square::Types::CatalogEcomSeoData }, optional: true, nullable: false

      field :path_to_root, -> { Internal::Types::Array[Square::Types::CategoryPathToRootNode] }, optional: true, nullable: true
    end
  end
end
