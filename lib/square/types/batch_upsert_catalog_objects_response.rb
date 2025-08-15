# frozen_string_literal: true

module Square
  class BatchUpsertCatalogObjectsResponse < Internal::Types::Model
    field :errors, Internal::Types::Array[Square::Error], optional: true, nullable: false
    field :objects, Internal::Types::Array[Square::CatalogObject], optional: true, nullable: false
    field :updated_at, String, optional: true, nullable: false
    field :id_mappings, Internal::Types::Array[Square::CatalogIdMapping], optional: true, nullable: false

  end
end
