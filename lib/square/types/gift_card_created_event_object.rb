# frozen_string_literal: true

module Square
  module Types
    # An object that contains the gift card associated with a `gift_card.created` event.
    class GiftCardCreatedEventObject < Internal::Types::Model
      field :gift_card, -> { Square::Types::GiftCard }, optional: true, nullable: false

    end
  end
end
