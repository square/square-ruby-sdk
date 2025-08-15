# frozen_string_literal: true

module Square
  # Represents an additional recipient (other than the merchant) entitled to a portion of the tender.
  # Support is currently limited to USD, CAD and GBP currencies
  class ChargeRequestAdditionalRecipient < Internal::Types::Model
    field :location_id, String, optional: false, nullable: false
    field :description, String, optional: false, nullable: false
    field :amount_money, Square::Money, optional: false, nullable: false

  end
end
