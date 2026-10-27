# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    # An object that contains the loyalty program associated with a `loyalty.program.updated` event.
    class LoyaltyProgramUpdatedEventObject < Internal::Types::Model
      field :loyalty_program, -> { Square::Types::LoyaltyProgram }, optional: true, nullable: false
    end
  end
end
