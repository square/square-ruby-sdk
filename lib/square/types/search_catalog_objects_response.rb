# frozen_string_literal: true

module Square
  class SearchCatalogObjectsResponse < Internal::Types::Model
    field :errors, Internal::Types::Array[Square::Error], optional: true, nullable: false
    field :cursor, String, optional: true, nullable: false
    field :objects, Internal::Types::Array[Square::CatalogObject], optional: true, nullable: false
    field :related_objects, Internal::Types::Array[Square::CatalogObject], optional: true, nullable: false
    field :latest_time, String, optional: true, nullable: false

  end
end
