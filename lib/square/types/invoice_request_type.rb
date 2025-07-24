# frozen_string_literal: true

module square.rb
# Indicates the type of the payment request. For more information, see
#  [Configuring payment
#  eloper.squareup.com/docs/invoices-api/create-publish-invoices#payment-requests).
  class InvoiceRequestType

    BALANCE = "BALANCE"
    DEPOSIT = "DEPOSIT"
    INSTALLMENT = "INSTALLMENT"

  end
end