# frozen_string_literal: true

module Square
  module Types
    # Information about the vendor of an item variation.
    class CatalogItemVariationVendorInformation < Internal::Types::Model
      field :vendor_id, -> { String }, optional: true, nullable: false
      field :vendor_code, -> { String }, optional: true, nullable: false
      field :unit_cost_money, -> { Square::Types::Money }, optional: true, nullable: false
    end
  end
end
