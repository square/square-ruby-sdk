# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    # Represents details about a `CLEAR_BALANCE` [gift card activity type](entity:GiftCardActivityType).
    class GiftCardActivityClearBalance < Internal::Types::Model
      field :reason, -> { Square::Types::GiftCardActivityClearBalanceReason }, optional: false, nullable: false
    end
  end
end
