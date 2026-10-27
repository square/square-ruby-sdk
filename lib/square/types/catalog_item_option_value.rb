# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    # An enumerated value that can link a
    # `CatalogItemVariation` to an item option as one of
    # its item option values.
    class CatalogItemOptionValue < Internal::Types::Model
      field :item_option_id, -> { String }, optional: true, nullable: true

      field :name, -> { String }, optional: true, nullable: true

      field :description, -> { String }, optional: true, nullable: true

      field :color, -> { String }, optional: true, nullable: true

      field :ordinal, -> { Integer }, optional: true, nullable: true
    end
  end
end
