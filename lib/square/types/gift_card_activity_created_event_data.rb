# frozen_string_literal: true

module Square
    module Types
        # Represents the data associated with a `gift_card.activity.created` event.
        class GiftCardActivityCreatedEventData < Square::Internal::Types::Model
            field :type, String, optional: true, nullable: false
            field :id, String, optional: true, nullable: false
            field :object, Square::GiftCardActivityCreatedEventObject, optional: true, nullable: false
        end
    end
end
