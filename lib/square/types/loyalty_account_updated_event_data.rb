# frozen_string_literal: true

module Square
    module Types
        # The data associated with a `loyalty.account.updated` event.
        class LoyaltyAccountUpdatedEventData < Square::Internal::Types::Model
            field :type, String, optional: true, nullable: false
            field :id, String, optional: true, nullable: false
            field :object, Square::LoyaltyAccountUpdatedEventObject, optional: true, nullable: false
        end
    end
end
