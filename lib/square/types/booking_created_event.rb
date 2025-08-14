# frozen_string_literal: true

module Square
    module Types
        # Published when a booking is created.
        # 
        # To receive this event with buyer-level permissions, you must have `APPOINTMENTS_READ` set for the OAuth scope.  
        # To receive this event with seller-level permissions, you must have `APPOINTMENTS_ALL_READ` and `APPOINTMENTS_READ` set for the OAuth scope.
        class BookingCreatedEvent < Square::Internal::Types::Model
            field :merchant_id, String, optional: true, nullable: false
            field :type, String, optional: true, nullable: false
            field :event_id, String, optional: true, nullable: false
            field :created_at, String, optional: true, nullable: false
            field :data, Square::BookingCreatedEventData, optional: true, nullable: false
        end
    end
end
