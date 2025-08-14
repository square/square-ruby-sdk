# frozen_string_literal: true

module Square
    module Types
        # An object that contains the loyalty program associated with a `loyalty.program.updated` event.
        class LoyaltyProgramUpdatedEventObject < Internal::Types::Model
            field :loyalty_program, Square::LoyaltyProgram, optional: true, nullable: false
        end
    end
end
