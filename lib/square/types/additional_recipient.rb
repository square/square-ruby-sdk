# frozen_string_literal: true

module Square
  module Types
    # Represents an additional recipient (other than the merchant) receiving a portion of this tender.
    class AdditionalRecipient < Internal::Types::Model
      field :location_id, String, optional: false, nullable: false
      field :description, String, optional: true, nullable: false
      field :amount_money, Square::Money, optional: false, nullable: false
      field :receivable_id, String, optional: true, nullable: false

    end
  end
end
