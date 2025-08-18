# frozen_string_literal: true

module Square
  module Types
    class CatalogObjectSubscriptionPlanVariation < Internal::Types::Model
      field :subscription_plan_variation_data, Square::Types::CatalogSubscriptionPlanVariation, optional: true, nullable: false

    end
  end
end
