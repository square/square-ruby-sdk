# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    # Related resources of the response `CatalogObject`s requested using `IncludeOptions`
    class IncludedResources < Internal::Types::Model
      field :nested_modifiers, -> { Internal::Types::Array[Square::Types::CatalogObject] }, optional: true, nullable: true

      field :ancestor_modifiers, -> { Internal::Types::Array[Square::Types::CatalogObject] }, optional: true, nullable: true
    end
  end
end
