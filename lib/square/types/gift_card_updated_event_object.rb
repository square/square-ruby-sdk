# frozen_string_literal: true

module Square
  # An object that contains the gift card associated with a `gift_card.updated` event.
  class GiftCardUpdatedEventObject < Internal::Types::Model
    field :gift_card, Square::GiftCard, optional: true, nullable: false

  end
end
