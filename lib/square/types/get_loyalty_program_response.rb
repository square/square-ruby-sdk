# frozen_string_literal: true

module Square
  # A response that contains the loyalty program.
  class GetLoyaltyProgramResponse < Internal::Types::Model
    field :errors, Internal::Types::Array[Square::Error], optional: true, nullable: false
    field :program, Square::LoyaltyProgram, optional: true, nullable: false

  end
end
