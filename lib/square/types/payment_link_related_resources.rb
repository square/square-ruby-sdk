# frozen_string_literal: true

module Square
  module Types
    class PaymentLinkRelatedResources < Internal::Types::Model
      field :orders, -> { Internal::Types::Array[Square::Types::Order] }, optional: true, nullable: false
      field :subscription_plans, lambda {
        Internal::Types::Array[Square::Types::CatalogObject]
      }, optional: true, nullable: false
    end
  end
end
