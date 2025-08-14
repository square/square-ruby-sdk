# frozen_string_literal: true

module Square
  module Types
    # Represents details about a `BLOCK` [gift card activity type](entity:GiftCardActivityType).
    class GiftCardActivityBlock < Internal::Types::Model
      field :reason, String, optional: false, nullable: false

    end
  end
end
