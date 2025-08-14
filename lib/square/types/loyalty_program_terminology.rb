# frozen_string_literal: true

module Square
    module Types
        # Represents the naming used for loyalty points.
        class LoyaltyProgramTerminology < Internal::Types::Model
            field :one, String, optional: false, nullable: false
            field :other, String, optional: false, nullable: false
        end
    end
end
