# frozen_string_literal: true

module Square
  # An enumerated value that can link a
  # `CatalogItemVariation` to an item option as one of
  # its item option values.
  class CatalogItemOptionValue < Internal::Types::Model
    field :item_option_id, String, optional: true, nullable: false
    field :name, String, optional: true, nullable: false
    field :description, String, optional: true, nullable: false
    field :color, String, optional: true, nullable: false
    field :ordinal, Integer, optional: true, nullable: false

  end
end
