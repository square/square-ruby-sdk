# frozen_string_literal: true

module Square
  module Types
    # Defines the response body returned from the [SearchCatalogItems](api-endpoint:Catalog-SearchCatalogItems) endpoint.
    class SearchCatalogItemsResponse < Internal::Types::Model
      field :errors, -> { Internal::Types::Array[Square::Types::Error] }, optional: true, nullable: false
      field :items, -> { Internal::Types::Array[Square::Types::CatalogObject] }, optional: true, nullable: false
      field :cursor, -> { String }, optional: true, nullable: false
      field :matched_variation_ids, -> { Internal::Types::Array[String] }, optional: true, nullable: false
    end
  end
end
