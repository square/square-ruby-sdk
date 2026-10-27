# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    # The payment methods that customers can use to pay an [invoice](entity:Invoice) on the Square-hosted invoice
    # payment page.
    class InvoiceAcceptedPaymentMethods < Internal::Types::Model
      field :card, -> { Internal::Types::Boolean }, optional: true, nullable: true

      field :square_gift_card, -> { Internal::Types::Boolean }, optional: true, nullable: true

      field :bank_account, -> { Internal::Types::Boolean }, optional: true, nullable: true

      field :buy_now_pay_later, -> { Internal::Types::Boolean }, optional: true, nullable: true

      field :cash_app_pay, -> { Internal::Types::Boolean }, optional: true, nullable: true
    end
  end
end
