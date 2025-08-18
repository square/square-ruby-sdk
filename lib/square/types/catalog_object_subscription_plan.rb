# frozen_string_literal: true

module Square
  module Types
    class CatalogObjectSubscriptionPlan < Internal::Types::Model
      field :subscription_plan_data, Square::Types::CatalogSubscriptionPlan, optional: true, nullable: false

    end
  end
end
