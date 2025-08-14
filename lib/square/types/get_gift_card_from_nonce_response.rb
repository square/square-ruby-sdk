# frozen_string_literal: true

module Square
    module Types
        # A response that contains a `GiftCard` object. If the request resulted in errors, 
        # the response contains a set of `Error` objects.
        class GetGiftCardFromNonceResponse < Square::Internal::Types::Model
            field :errors, Square::Internal::Types::Array[Square::Error], optional: true, nullable: false
            field :gift_card, Square::GiftCard, optional: true, nullable: false
        end
    end
end
