# frozen_string_literal: true

module Square
    module Types
        # A tax applicable to an item.
        class CatalogTax < Square::Internal::Types::Model
            field :name, String, optional: true, nullable: false
            field :calculation_phase, Square::TaxCalculationPhase, optional: true, nullable: false
            field :inclusion_type, Square::TaxInclusionType, optional: true, nullable: false
            field :percentage, String, optional: true, nullable: false
            field :applies_to_custom_amounts, Square::Internal::Types::Boolean, optional: true, nullable: false
            field :enabled, Square::Internal::Types::Boolean, optional: true, nullable: false
            field :applies_to_product_set_id, String, optional: true, nullable: false
        end
    end
end
