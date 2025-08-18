# frozen_string_literal: true

module Square
  module Types
    # An object that contains the gift card activity associated with a 
    # `gift_card.activity.updated` event.
    class GiftCardActivityUpdatedEventObject < Internal::Types::Model
      field :gift_card_activity, -> { Square::Types::GiftCardActivity }, optional: true, nullable: false

    end
  end
end
