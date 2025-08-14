# frozen_string_literal: true

module Square
  module Types
    # The payment methods that customers can use to pay an [invoice](entity:Invoice) on the Square-hosted invoice payment page.
    class InvoiceAcceptedPaymentMethods < Internal::Types::Model
      field :card, Internal::Types::Boolean, optional: true, nullable: false
      field :square_gift_card, Internal::Types::Boolean, optional: true, nullable: false
      field :bank_account, Internal::Types::Boolean, optional: true, nullable: false
      field :buy_now_pay_later, Internal::Types::Boolean, optional: true, nullable: false
      field :cash_app_pay, Internal::Types::Boolean, optional: true, nullable: false

    end
  end
end
