# frozen_string_literal: true

module Square
  module Types
    module BankAccountType
      extend Square::Internal::Types::Enum

      CHECKING = "CHECKING"
      SAVINGS = "SAVINGS"
      INVESTMENT = "INVESTMENT"
      OTHER = "OTHER"
      BUSINESS_CHECKING = "BUSINESS_CHECKING"end
  end
end
