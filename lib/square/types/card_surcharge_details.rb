# frozen_string_literal: true

module Square
  module Types
    # Details related to an attempt to apply a card surcharge to this payment.  When surcharge
    # eligibility is not known in advance, such as when the card type (debit or credit) is required
    # to make the eligibility determination, proposed_card_surcharge_money and
    # proposed_additional_amount_money will match the values in the request, while card_surcharge_money
    # and additional_amount_money are present only when the payment has a surcharge applied.
    class CardSurchargeDetails < Internal::Types::Model
      field :card_surcharge_money, -> { Square::Types::Money }, optional: true, nullable: false
    end
  end
end
