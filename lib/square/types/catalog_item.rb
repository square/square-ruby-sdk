# frozen_string_literal: true

module Square
  # A [CatalogObject](entity:CatalogObject) instance of the `ITEM` type, also referred to as an item, in the catalog.
  class CatalogItem < Internal::Types::Model
    field :name, String, optional: true, nullable: false
    field :description, String, optional: true, nullable: false
    field :abbreviation, String, optional: true, nullable: false
    field :label_color, String, optional: true, nullable: false
    field :is_taxable, Internal::Types::Boolean, optional: true, nullable: false
    field :category_id, String, optional: true, nullable: false
    field :tax_ids, Internal::Types::Array[String], optional: true, nullable: false
    field :modifier_list_info, Internal::Types::Array[Square::CatalogItemModifierListInfo], optional: true, nullable: false
    field :variations, Internal::Types::Array[Square::CatalogObject], optional: true, nullable: false
    field :product_type, Square::CatalogItemProductType, optional: true, nullable: false
    field :skip_modifier_screen, Internal::Types::Boolean, optional: true, nullable: false
    field :item_options, Internal::Types::Array[Square::CatalogItemOptionForItem], optional: true, nullable: false
    field :ecom_uri, String, optional: true, nullable: false
    field :ecom_image_uris, Internal::Types::Array[String], optional: true, nullable: false
    field :image_ids, Internal::Types::Array[String], optional: true, nullable: false
    field :sort_name, String, optional: true, nullable: false
    field :categories, Internal::Types::Array[Square::CatalogObjectCategory], optional: true, nullable: false
    field :description_html, String, optional: true, nullable: false
    field :description_plaintext, String, optional: true, nullable: false
    field :channels, Internal::Types::Array[String], optional: true, nullable: false
    field :is_archived, Internal::Types::Boolean, optional: true, nullable: false
    field :ecom_seo_data, Square::CatalogEcomSeoData, optional: true, nullable: false
    field :food_and_beverage_details, Square::CatalogItemFoodAndBeverageDetails, optional: true, nullable: false
    field :reporting_category, Square::CatalogObjectCategory, optional: true, nullable: false
    field :is_alcoholic, Internal::Types::Boolean, optional: true, nullable: false

  end
end
