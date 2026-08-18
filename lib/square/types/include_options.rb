# frozen_string_literal: true

module Square
  module Types
    # Options to include related resources of the requested `CatalogObject`s. Related resources will be included in
    # `IncludedResources` in the response.
    class IncludeOptions < Internal::Types::Model
      field :include, -> { Internal::Types::Array[Square::Types::IncludeType] }, optional: true, nullable: false
    end
  end
end
