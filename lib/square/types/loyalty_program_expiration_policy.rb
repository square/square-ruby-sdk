# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    # Describes when the loyalty program expires.
    class LoyaltyProgramExpirationPolicy < Internal::Types::Model
      field :expiration_duration, -> { String }, optional: false, nullable: false
    end
  end
end
