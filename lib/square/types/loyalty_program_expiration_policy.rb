# frozen_string_literal: true

module Square
  # Describes when the loyalty program expires.
  class LoyaltyProgramExpirationPolicy < Internal::Types::Model
    field :expiration_duration, String, optional: false, nullable: false

  end
end
