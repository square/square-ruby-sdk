# frozen_string_literal: true

module Square
    module Types
        # Information about fulfillment updates.
        class OrderFulfillmentUpdatedUpdate < Internal::Types::Model
            field :fulfillment_uid, String, optional: true, nullable: false
            field :old_state, Square::FulfillmentState, optional: true, nullable: false
            field :new_state, Square::FulfillmentState, optional: true, nullable: false
        end
    end
end
