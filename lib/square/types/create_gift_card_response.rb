# frozen_string_literal: true

module Square
    module Types
        # A response that contains a `GiftCard`. The response might contain a set of `Error` objects if the request
        # resulted in errors.
        class CreateGiftCardResponse < Internal::Types::Model
            field :errors, Internal::Types::Array[Square::Error], optional: true, nullable: false
            field :gift_card, Square::GiftCard, optional: true, nullable: false
        end
    end
end
