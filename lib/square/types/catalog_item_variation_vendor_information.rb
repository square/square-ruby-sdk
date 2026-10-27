# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    # Information about the vendor of an item variation.
    class CatalogItemVariationVendorInformation < Internal::Types::Model
      field :vendor_id, -> { String }, optional: true, nullable: true

      field :vendor_code, -> { String }, optional: true, nullable: true

      field :unit_cost_money, -> { Square::Types::Money }, optional: true, nullable: false
    end
  end
end
