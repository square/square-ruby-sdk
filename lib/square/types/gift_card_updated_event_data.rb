# frozen_string_literal: true

module Square
    module Types
        # The data associated with a `gift_card.updated` event.
        class GiftCardUpdatedEventData < Square::Internal::Types::Model
            field :type, String, optional: true, nullable: false
            field :id, String, optional: true, nullable: false
            field :object, Square::GiftCardUpdatedEventObject, optional: true, nullable: false
        end
    end
end
