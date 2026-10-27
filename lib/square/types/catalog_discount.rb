# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    # A discount applicable to items.
    class CatalogDiscount < Internal::Types::Model
      field :name, -> { String }, optional: true, nullable: true

      field :discount_type, -> { Square::Types::CatalogDiscountType }, optional: true, nullable: false

      field :percentage, -> { String }, optional: true, nullable: true

      field :amount_money, -> { Square::Types::Money }, optional: true, nullable: false

      field :pin_required, -> { Internal::Types::Boolean }, optional: true, nullable: true

      field :label_color, -> { String }, optional: true, nullable: true

      field :modify_tax_basis, -> { Square::Types::CatalogDiscountModifyTaxBasis }, optional: true, nullable: false

      field :maximum_amount_money, -> { Square::Types::Money }, optional: true, nullable: false
    end
  end
end
