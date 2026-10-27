# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    module TransactionType
      extend Square::Internal::Types::Enum

      DEBIT = "DEBIT"
      CREDIT = "CREDIT"
    end
  end
end
