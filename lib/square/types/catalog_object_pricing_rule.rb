# frozen_string_literal: true

module Square
  module Types
    class CatalogObjectPricingRule < Internal::Types::Model
      field :pricing_rule_data, -> { Square::Types::CatalogPricingRule }, optional: true, nullable: false

    end
  end
end
