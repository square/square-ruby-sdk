# frozen_string_literal: true

module Square
    module Types
        # A response that contains a list of `GiftCard` objects. If the request resulted in errors, 
        # the response contains a set of `Error` objects.
        class ListGiftCardsResponse < Square::Internal::Types::Model
            field :errors, Square::Internal::Types::Array[Square::Types::Error], optional: true, nullable: false
            field :gift_cards, Square::Internal::Types::Array[Square::GiftCard], optional: true, nullable: false
            field :cursor, String, optional: true, nullable: false
        end
    end
end
