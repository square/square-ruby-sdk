# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    # A [CatalogObject](entity:CatalogObject) instance of the `ITEM` type, also referred to as an item, in the catalog.
    class CatalogItem < Internal::Types::Model
      field :name, -> { String }, optional: true, nullable: true

      field :description, -> { String }, optional: true, nullable: true

      field :abbreviation, -> { String }, optional: true, nullable: true

      field :label_color, -> { String }, optional: true, nullable: true

      field :is_taxable, -> { Internal::Types::Boolean }, optional: true, nullable: true

      field :category_id, -> { String }, optional: true, nullable: true

      field :buyer_facing_name, -> { String }, optional: true, nullable: true

      field :tax_ids, -> { Internal::Types::Array[String] }, optional: true, nullable: true

      field :modifier_list_info, -> { Internal::Types::Array[Square::Types::CatalogItemModifierListInfo] }, optional: true, nullable: true

      field :variations, -> { Internal::Types::Array[Square::Types::CatalogObject] }, optional: true, nullable: true

      field :product_type, -> { Square::Types::CatalogItemProductType }, optional: true, nullable: false

      field :skip_modifier_screen, -> { Internal::Types::Boolean }, optional: true, nullable: true

      field :item_options, -> { Internal::Types::Array[Square::Types::CatalogItemOptionForItem] }, optional: true, nullable: true

      field :ecom_uri, -> { String }, optional: true, nullable: true

      field :ecom_image_uris, -> { Internal::Types::Array[String] }, optional: true, nullable: true

      field :image_ids, -> { Internal::Types::Array[String] }, optional: true, nullable: true

      field :sort_name, -> { String }, optional: true, nullable: true

      field :categories, -> { Internal::Types::Array[Square::Types::CatalogObjectCategory] }, optional: true, nullable: true

      field :description_html, -> { String }, optional: true, nullable: true

      field :description_plaintext, -> { String }, optional: true, nullable: false

      field :kitchen_name, -> { String }, optional: true, nullable: true

      field :channels, -> { Internal::Types::Array[String] }, optional: true, nullable: true

      field :is_archived, -> { Internal::Types::Boolean }, optional: true, nullable: true

      field :ecom_seo_data, -> { Square::Types::CatalogEcomSeoData }, optional: true, nullable: false

      field :food_and_beverage_details, -> { Square::Types::CatalogItemFoodAndBeverageDetails }, optional: true, nullable: false

      field :reporting_category, -> { Square::Types::CatalogObjectCategory }, optional: true, nullable: false

      field :is_alcoholic, -> { Internal::Types::Boolean }, optional: true, nullable: true
    end
  end
end
