# frozen_string_literal: true

module Square
    module Types
        # Information about a booking creator.
        class BookingCreatorDetails < Internal::Types::Model
            field :creator_type, Square::BookingCreatorDetailsCreatorType, optional: true, nullable: false
            field :team_member_id, String, optional: true, nullable: false
            field :customer_id, String, optional: true, nullable: false
        end
    end
end
