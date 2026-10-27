# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    class OrderLineItemAppliedServiceCharge < Internal::Types::Model
      field :uid, -> { String }, optional: true, nullable: true

      field :service_charge_uid, -> { String }, optional: false, nullable: false

      field :applied_money, -> { Square::Types::Money }, optional: true, nullable: false
    end
  end
end
