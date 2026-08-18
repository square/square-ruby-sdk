# frozen_string_literal: true

module Square
  module Types
    # Query to find `CatalogModifier` objects that reference a given `CatalogModifierList` in their
    # `child_modifier_list_ids` field.
    class CatalogQueryModifiersForChildList < Internal::Types::Model
      field :child_modifier_list_ids, -> { Internal::Types::Array[String] }, optional: false, nullable: false
    end
  end
end
