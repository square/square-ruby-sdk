# frozen_string_literal: true

module Square
    module Types
        # The data associated with the event.
        class CustomerUpdatedEventData < Internal::Types::Model
            field :type, String, optional: true, nullable: false
            field :id, String, optional: true, nullable: false
            field :object, Square::CustomerUpdatedEventObject, optional: true, nullable: false
        end
    end
end
