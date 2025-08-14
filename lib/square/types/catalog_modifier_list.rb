# frozen_string_literal: true

module Square
    module Types
        # A container for a list of modifiers, or a text-based modifier.
        # For text-based modifiers, this represents text configuration for an item. (For example, custom text to print on a t-shirt).
        # For non text-based modifiers, this represents a list of modifiers that can be applied to items at the time of sale.
        # (For example, a list of condiments for a hot dog, or a list of ice cream flavors).
        # Each element of the modifier list is a `CatalogObject` instance of the `MODIFIER` type.
        class CatalogModifierList < Internal::Types::Model
            field :name, String, optional: true, nullable: false
            field :ordinal, Integer, optional: true, nullable: false
            field :selection_type, Square::CatalogModifierListSelectionType, optional: true, nullable: false
            field :modifiers, Internal::Types::Array[Square::CatalogObject], optional: true, nullable: false
            field :image_ids, Internal::Types::Array[String], optional: true, nullable: false
            field :allow_quantities, Internal::Types::Boolean, optional: true, nullable: false
            field :is_conversational, Internal::Types::Boolean, optional: true, nullable: false
            field :modifier_type, Square::CatalogModifierListModifierType, optional: true, nullable: false
            field :max_length, Integer, optional: true, nullable: false
            field :text_required, Internal::Types::Boolean, optional: true, nullable: false
            field :internal_name, String, optional: true, nullable: false
            field :min_selected_modifiers, Integer, optional: true, nullable: false
            field :max_selected_modifiers, Integer, optional: true, nullable: false
            field :hidden_from_customer, Internal::Types::Boolean, optional: true, nullable: false
        end
    end
end
