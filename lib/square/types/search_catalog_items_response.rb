# frozen_string_literal: true

module Square
    module Types
        # Defines the response body returned from the [SearchCatalogItems](api-endpoint:Catalog-SearchCatalogItems) endpoint.
        class SearchCatalogItemsResponse < Square::Internal::Types::Model
            field :errors, Square::Internal::Types::Array[Square::Error], optional: true, nullable: false
            field :items, Square::Internal::Types::Array[Square::CatalogObject], optional: true, nullable: false
            field :cursor, String, optional: true, nullable: false
            field :matched_variation_ids, Square::Internal::Types::Array[String], optional: true, nullable: false
        end
    end
end
