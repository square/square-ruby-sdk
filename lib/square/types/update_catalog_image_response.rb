# frozen_string_literal: true

module Square
  module Types
    class UpdateCatalogImageResponse < Internal::Types::Model
      field :errors, -> { Internal::Types::Array[Square::Types::Error] }, optional: true, nullable: false
      field :image, -> { Square::Types::CatalogObject }, optional: true, nullable: false
    end
  end
end
