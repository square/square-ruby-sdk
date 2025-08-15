# frozen_string_literal: true

module Square
  # An object that contains the gift card activity associated with a 
  # `gift_card.activity.updated` event.
  class GiftCardActivityUpdatedEventObject < Internal::Types::Model
    field :gift_card_activity, Square::GiftCardActivity, optional: true, nullable: false

  end
end
