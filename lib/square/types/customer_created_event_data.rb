# frozen_string_literal: true

module Square
    module Types
        # The data associated with the event.
        class CustomerCreatedEventData < Square::Internal::Types::Model
            field :type, String, optional: true, nullable: false
            field :id, String, optional: true, nullable: false
            field :object, Square::CustomerCreatedEventObject, optional: true, nullable: false
        end
    end
end
