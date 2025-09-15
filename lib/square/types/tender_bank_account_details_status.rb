# frozen_string_literal: true

module Square
  module Types
    module TenderBankAccountDetailsStatus
      extend Square::Internal::Types::Enum

      PENDING = "PENDING"
      COMPLETED = "COMPLETED"
      FAILED = "FAILED"
    end
  end
end
