# frozen_string_literal: true

module Square
  module Types
    # A discount applicable to items.
    class CatalogDiscount < Internal::Types::Model
      field :name, String, optional: true, nullable: false
      field :discount_type, Square::CatalogDiscountType, optional: true, nullable: false
      field :percentage, String, optional: true, nullable: false
      field :amount_money, Square::Money, optional: true, nullable: false
      field :pin_required, Internal::Types::Boolean, optional: true, nullable: false
      field :label_color, String, optional: true, nullable: false
      field :modify_tax_basis, Square::CatalogDiscountModifyTaxBasis, optional: true, nullable: false
      field :maximum_amount_money, Square::Money, optional: true, nullable: false

    end
  end
end
