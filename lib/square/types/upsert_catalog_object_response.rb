# frozen_string_literal: true

module Square
  module Types
    class UpsertCatalogObjectResponse < Internal::Types::Model
      field :errors, -> { Internal::Types::Array[Square::Types::Error] }, optional: true, nullable: false
      field :catalog_object, -> { Square::Types::CatalogObject }, optional: true, nullable: false
      field :id_mappings, lambda {
        Internal::Types::Array[Square::Types::CatalogIdMapping]
      }, optional: true, nullable: false
    end
  end
end
