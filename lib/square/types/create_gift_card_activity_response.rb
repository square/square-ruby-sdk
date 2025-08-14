# frozen_string_literal: true

module Square
    module Types
        # A response that contains a `GiftCardActivity` that was created.
        # The response might contain a set of `Error` objects if the request resulted in errors.
        class CreateGiftCardActivityResponse < Internal::Types::Model
            field :errors, Internal::Types::Array[Square::Error], optional: true, nullable: false
            field :gift_card_activity, Square::GiftCardActivity, optional: true, nullable: false
        end
    end
end
