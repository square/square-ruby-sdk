# frozen_string_literal: true

module Square
    module Types
        # The data associated with a `gift_card.created` event.
        class GiftCardCreatedEventData < Square::Internal::Types::Model
            field :type, String, optional: true, nullable: false
            field :id, String, optional: true, nullable: false
            field :object, Square::GiftCardCreatedEventObject, optional: true, nullable: false
        end
    end
end
