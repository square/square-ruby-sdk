# frozen_string_literal: true

module Square
  # Represents additional details of a tender with `type` `CARD` or `SQUARE_GIFT_CARD`
  class TenderCardDetails < Internal::Types::Model
    field :status, Square::TenderCardDetailsStatus, optional: true, nullable: false
    field :card, Square::Card, optional: true, nullable: false
    field :entry_method, Square::TenderCardDetailsEntryMethod, optional: true, nullable: false

  end
end
