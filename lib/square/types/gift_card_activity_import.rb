# frozen_string_literal: true

module Square
  module Types
    # Represents details about an `IMPORT` [gift card activity type](entity:GiftCardActivityType).
    # This activity type is used when Square imports a third-party gift card, in which case the 
    # `gan_source` of the gift card is set to `OTHER`.
    class GiftCardActivityImport < Internal::Types::Model
      field :amount_money, -> { Square::Types::Money }, optional: false, nullable: false

    end
  end
end
