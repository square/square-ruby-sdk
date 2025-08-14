# frozen_string_literal: true

module Square
    module Types
        # A parent Catalog Object model represents a set of Quick Amounts and the settings control the amounts.
        class CatalogQuickAmountsSettings < Square::Internal::Types::Model
            field :option, Square::CatalogQuickAmountsSettingsOption, optional: false, nullable: false
            field :eligible_for_auto_amounts, Square::Internal::Types::Boolean, optional: true, nullable: false
            field :amounts, Square::Internal::Types::Array[Square::CatalogQuickAmount], optional: true, nullable: false
        end
    end
end
