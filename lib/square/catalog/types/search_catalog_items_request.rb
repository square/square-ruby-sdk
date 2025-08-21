# frozen_string_literal: true

module Square
  module Catalog
    module Types
      class SearchCatalogItemsRequest < Internal::Types::Model
        field :text_filter, -> { String }, optional: true, nullable: false
        field :category_ids, -> { Internal::Types::Array[String] }, optional: true, nullable: false
        field :stock_levels, lambda {
          Internal::Types::Array[Square::Types::SearchCatalogItemsRequestStockLevel]
        }, optional: true, nullable: false
        field :enabled_location_ids, -> { Internal::Types::Array[String] }, optional: true, nullable: false
        field :cursor, -> { String }, optional: true, nullable: false
        field :limit, -> { Integer }, optional: true, nullable: false
        field :sort_order, -> { Square::Types::SortOrder }, optional: true, nullable: false
        field :product_types, lambda {
          Internal::Types::Array[Square::Types::CatalogItemProductType]
        }, optional: true, nullable: false
        field :custom_attribute_filters, lambda {
          Internal::Types::Array[Square::Types::CustomAttributeFilter]
        }, optional: true, nullable: false
        field :archived_state, -> { Square::Types::ArchivedState }, optional: true, nullable: false
      end
    end
  end
end
