# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    module InvoiceRequestType
      extend Square::Internal::Types::Enum

      BALANCE = "BALANCE"
      DEPOSIT = "DEPOSIT"
      INSTALLMENT = "INSTALLMENT"
    end
  end
end
