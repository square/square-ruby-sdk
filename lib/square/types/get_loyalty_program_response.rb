# frozen_string_literal: true

module Square
    module Types
        # A response that contains the loyalty program.
        class GetLoyaltyProgramResponse < Square::Internal::Types::Model
            field :errors, Square::Internal::Types::Array[Square::Error], optional: true, nullable: false
            field :program, Square::LoyaltyProgram, optional: true, nullable: false
        end
    end
end
