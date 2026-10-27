# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    #  An option that can be assigned to an item.
    # For example, a t-shirt item may offer a color option or a size option.
    class CatalogItemOptionForItem < Internal::Types::Model
      field :item_option_id, -> { String }, optional: true, nullable: true
    end
  end
end
