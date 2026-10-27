# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    # Controls how a modifier list is applied to a specific item. This object allows for item-specific customization of
    # modifier list behavior
    # and provides the ability to override global modifier list settings.
    class CatalogItemModifierListInfo < Internal::Types::Model
      field :modifier_list_id, -> { String }, optional: false, nullable: false

      field :modifier_overrides, -> { Internal::Types::Array[Square::Types::CatalogModifierOverride] }, optional: true, nullable: true

      field :min_selected_modifiers, -> { Integer }, optional: true, nullable: true

      field :max_selected_modifiers, -> { Integer }, optional: true, nullable: true

      field :enabled, -> { Internal::Types::Boolean }, optional: true, nullable: true

      field :ordinal, -> { Integer }, optional: true, nullable: true

      field :allow_quantities, -> { Square::Types::CatalogModifierToggleOverrideType }, optional: true, nullable: false

      field :is_conversational, -> { Square::Types::CatalogModifierToggleOverrideType }, optional: true, nullable: false

      field :hidden_from_customer_override, -> { Square::Types::CatalogModifierToggleOverrideType }, optional: true, nullable: false
    end
  end
end
