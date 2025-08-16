# frozen_string_literal: true

module Square
  module Types
    # Represents details about a `DEACTIVATE` [gift card activity type](entity:GiftCardActivityType).
    class GiftCardActivityDeactivate < Internal::Types::Model
      field :reason, Square::GiftCardActivityDeactivateReason, optional: false, nullable: false

    end
  end
end
