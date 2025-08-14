# frozen_string_literal: true

module Square
    module Types
        # The hours of operation for a location.
        class BusinessHours < Square::Internal::Types::Model
            field :periods, Square::Internal::Types::Array[Square::BusinessHoursPeriod], optional: true, nullable: false
        end
    end
end
