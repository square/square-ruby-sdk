# frozen_string_literal: true

module Square
  module Types
    class UpsertCatalogObjectResponse < Internal::Types::Model
      field :errors, Internal::Types::Array[Square::Error], optional: true, nullable: false
      field :catalog_object, Square::CatalogObject, optional: true, nullable: false
      field :id_mappings, Internal::Types::Array[Square::CatalogIdMapping], optional: true, nullable: false

    end
  end
end
