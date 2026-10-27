# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    # A group of variations for a `CatalogItem`.
    class CatalogItemOption < Internal::Types::Model
      field :name, -> { String }, optional: true, nullable: true

      field :display_name, -> { String }, optional: true, nullable: true

      field :description, -> { String }, optional: true, nullable: true

      field :show_colors, -> { Internal::Types::Boolean }, optional: true, nullable: true

      field :values, -> { Internal::Types::Array[Square::Types::CatalogObject] }, optional: true, nullable: true
    end
  end
end
