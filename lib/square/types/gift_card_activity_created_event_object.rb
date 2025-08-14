# frozen_string_literal: true

module Square
    module Types
        # An object that contains the gift card activity associated with a 
        # `gift_card.activity.created` event.
        class GiftCardActivityCreatedEventObject < Square::Internal::Types::Model
            field :gift_card_activity, Square::GiftCardActivity, optional: true, nullable: false
        end
    end
end
