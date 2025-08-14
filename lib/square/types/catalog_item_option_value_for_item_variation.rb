# frozen_string_literal: true

module Square
    module Types
        # A `CatalogItemOptionValue` links an item variation to an item option as
        # an item option value. For example, a t-shirt item may offer a color option and
        # a size option. An item option value would represent each variation of t-shirt:
        # For example, "Color:Red, Size:Small" or "Color:Blue, Size:Medium".
        class CatalogItemOptionValueForItemVariation < Internal::Types::Model
            field :item_option_id, String, optional: true, nullable: false
            field :item_option_value_id, String, optional: true, nullable: false
        end
    end
end
