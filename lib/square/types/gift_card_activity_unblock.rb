# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    # Represents details about an `UNBLOCK` [gift card activity type](entity:GiftCardActivityType).
    class GiftCardActivityUnblock < Internal::Types::Model
      field :reason, -> { String }, optional: false, nullable: false
    end
  end
end
