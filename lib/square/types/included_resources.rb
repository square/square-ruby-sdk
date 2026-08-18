# frozen_string_literal: true

module Square
  module Types
    # Related resources of the response `CatalogObject`s requested using `IncludeOptions`
    class IncludedResources < Internal::Types::Model
      field :nested_modifiers, -> { Internal::Types::Array[Square::Types::CatalogObject] }, optional: true, nullable: false
      field :ancestor_modifiers, -> { Internal::Types::Array[Square::Types::CatalogObject] }, optional: true, nullable: false
    end
  end
end
