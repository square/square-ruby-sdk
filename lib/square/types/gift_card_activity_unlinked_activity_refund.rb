# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    # Represents details about an `UNLINKED_ACTIVITY_REFUND` [gift card activity type](entity:GiftCardActivityType).
    class GiftCardActivityUnlinkedActivityRefund < Internal::Types::Model
      field :amount_money, -> { Square::Types::Money }, optional: false, nullable: false

      field :reference_id, -> { String }, optional: true, nullable: true

      field :payment_id, -> { String }, optional: true, nullable: false
    end
  end
end
