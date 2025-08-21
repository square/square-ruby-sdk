# frozen_string_literal: true

module Square
  module Types
    class BatchGetCatalogObjectsResponse < Internal::Types::Model
      field :errors, -> { Internal::Types::Array[Square::Types::Error] }, optional: true, nullable: false
      field :objects, -> { Internal::Types::Array[Square::Types::CatalogObject] }, optional: true, nullable: false
      field :related_objects, lambda {
        Internal::Types::Array[Square::Types::CatalogObject]
      }, optional: true, nullable: false
    end
  end
end
