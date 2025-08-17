# frozen_string_literal: true

module Square
  module Types
    module TransactionType
      extends Square::Internal::Types::Enum
      DEBIT = "DEBIT"
      CREDIT = "CREDIT"end
  end
end
