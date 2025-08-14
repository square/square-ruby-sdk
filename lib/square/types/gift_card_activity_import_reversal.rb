# frozen_string_literal: true

module Square
    module Types
        # Represents details about an `IMPORT_REVERSAL` [gift card activity type](entity:GiftCardActivityType).
        class GiftCardActivityImportReversal < Internal::Types::Model
            field :amount_money, Square::Money, optional: false, nullable: false
        end
    end
end
