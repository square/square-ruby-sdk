# frozen_string_literal: true

module Square
  module Types
    class OrderLineItemAppliedServiceCharge < Internal::Types::Model
      field :uid, -> { String }, optional: true, nullable: false
      field :service_charge_uid, -> { String }, optional: false, nullable: false
      field :applied_money, -> { Square::Types::Money }, optional: true, nullable: false
    end
  end
end
