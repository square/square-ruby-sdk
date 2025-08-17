# frozen_string_literal: true

module Square
  module Types
    module InvoiceRequestType
      extends Square::Internal::Types::Enum
      BALANCE = "BALANCE"
      DEPOSIT = "DEPOSIT"
      INSTALLMENT = "INSTALLMENT"end
  end
end
