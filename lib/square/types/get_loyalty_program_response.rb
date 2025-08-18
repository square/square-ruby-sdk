# frozen_string_literal: true

module Square
  module Types
    # A response that contains the loyalty program.
    class GetLoyaltyProgramResponse < Internal::Types::Model
      field :errors, -> { Internal::Types::Array[Square::Types::Error] }, optional: true, nullable: false
      field :program, -> { Square::Types::LoyaltyProgram }, optional: true, nullable: false

    end
  end
end
