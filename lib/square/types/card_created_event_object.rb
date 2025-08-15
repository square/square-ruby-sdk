# frozen_string_literal: true

module Square
  class CardCreatedEventObject < Internal::Types::Model
    field :card, Square::Card, optional: true, nullable: false

  end
end
