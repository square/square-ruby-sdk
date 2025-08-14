# frozen_string_literal: true

module Square
    module Types
        class SearchAvailabilityResponse < Square::Internal::Types::Model
            field :availabilities, Square::Internal::Types::Array[Square::Availability], optional: true, nullable: false
            field :errors, Square::Internal::Types::Array[Square::Error], optional: true, nullable: false
        end
    end
end
