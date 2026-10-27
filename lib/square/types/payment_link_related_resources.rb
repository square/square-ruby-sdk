# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    class PaymentLinkRelatedResources < Internal::Types::Model
      field :orders, -> { Internal::Types::Array[Square::Types::Order] }, optional: true, nullable: true

      field :subscription_plans, -> { Internal::Types::Array[Square::Types::CatalogObject] }, optional: true, nullable: true
    end
  end
end
