# frozen_string_literal: true

module Square
  module Types
    # Represents additional details of a tender with `type` `CARD` or `SQUARE_GIFT_CARD`
    class TenderCardDetails < Internal::Types::Model
      field :status, -> { Square::Types::TenderCardDetailsStatus }, optional: true, nullable: false
      field :card, -> { Square::Types::Card }, optional: true, nullable: false
      field :entry_method, -> { Square::Types::TenderCardDetailsEntryMethod }, optional: true, nullable: false
    end
  end
end
