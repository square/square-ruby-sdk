# frozen_string_literal: true

module Square
    module Types
        # An object that contains the customer associated with the event.
        class CustomerDeletedEventObject < Internal::Types::Model
            field :customer, Square::Customer, optional: true, nullable: false
            field :event_context, Square::CustomerDeletedEventEventContext, optional: true, nullable: false
        end
    end
end
