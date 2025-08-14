# frozen_string_literal: true

module Square
    module Types
        # A response that contains all loyalty programs.
        class ListLoyaltyProgramsResponse < Square::Internal::Types::Model
            field :errors, Square::Internal::Types::Array[Square::Error], optional: true, nullable: false
            field :programs, Square::Internal::Types::Array[Square::LoyaltyProgram], optional: true, nullable: false
        end
    end
end
