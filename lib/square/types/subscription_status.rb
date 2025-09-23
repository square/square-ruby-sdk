# frozen_string_literal: true

module Square
  module Types
    module SubscriptionStatus
      extend Square::Internal::Types::Enum

      PENDING = "PENDING"
      ACTIVE = "ACTIVE"
      CANCELED = "CANCELED"
      DEACTIVATED = "DEACTIVATED"
      PAUSED = "PAUSED"
      COMPLETED = "COMPLETED"
    end
  end
end
