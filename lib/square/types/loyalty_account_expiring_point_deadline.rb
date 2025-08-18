# frozen_string_literal: true

module Square
  module Types
    # Represents a set of points for a loyalty account that are scheduled to expire on a specific date.
    class LoyaltyAccountExpiringPointDeadline < Internal::Types::Model
      field :points, -> { Integer }, optional: false, nullable: false
      field :expires_at, -> { String }, optional: false, nullable: false

    end
  end
end
