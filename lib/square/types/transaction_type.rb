# frozen_string_literal: true

module Square
  module Types
    module TransactionType
      extend Square::Internal::Types::Enum

      DEBIT = "DEBIT"
      CREDIT = "CREDIT"
    end
  end
end
