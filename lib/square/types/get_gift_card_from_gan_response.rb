# frozen_string_literal: true

module Square
    module Types
        # A response that contains a `GiftCard`. This response might contain a set of `Error` objects
        # if the request resulted in errors.
        class GetGiftCardFromGanResponse < Square::Internal::Types::Model
            field :errors, Square::Internal::Types::Array[Square::Types::Error], optional: true, nullable: false
            field :gift_card, Square::GiftCard, optional: true, nullable: false
        end
    end
end
