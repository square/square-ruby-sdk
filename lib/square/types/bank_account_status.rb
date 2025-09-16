# frozen_string_literal: true

module Square
  module Types
    module BankAccountStatus
      extend Square::Internal::Types::Enum

      VERIFICATION_IN_PROGRESS = "VERIFICATION_IN_PROGRESS"
      VERIFIED = "VERIFIED"
      DISABLED = "DISABLED"
    end
  end
end
