# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    # A batch of catalog objects.
    class CatalogObjectBatch < Internal::Types::Model
      field :objects, -> { Internal::Types::Array[Square::Types::CatalogObject] }, optional: false, nullable: false
    end
  end
end
