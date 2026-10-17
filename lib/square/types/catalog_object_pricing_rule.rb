# frozen_string_literal: true

module Square
  module Types
    class CatalogObjectPricingRule < CatalogObjectBase
      field :pricing_rule_data, -> { Square::Types::CatalogPricingRule }, optional: true, nullable: false
    end
  end
end
