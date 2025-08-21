# frozen_string_literal: true

module Square
  module Types
    class CatalogObjectModifier < Internal::Types::Model
      field :modifier_data, -> { Square::Types::CatalogModifier }, optional: true, nullable: false
    end
  end
end
