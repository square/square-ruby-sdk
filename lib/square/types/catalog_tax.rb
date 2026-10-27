# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    # A tax applicable to an item.
    class CatalogTax < Internal::Types::Model
      field :name, -> { String }, optional: true, nullable: true

      field :calculation_phase, -> { Square::Types::TaxCalculationPhase }, optional: true, nullable: false

      field :inclusion_type, -> { Square::Types::TaxInclusionType }, optional: true, nullable: false

      field :percentage, -> { String }, optional: true, nullable: true

      field :applies_to_custom_amounts, -> { Internal::Types::Boolean }, optional: true, nullable: true

      field :enabled, -> { Internal::Types::Boolean }, optional: true, nullable: true

      field :applies_to_product_set_id, -> { String }, optional: true, nullable: true
    end
  end
end
