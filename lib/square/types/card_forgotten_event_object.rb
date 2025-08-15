# frozen_string_literal: true

module Square
  class CardForgottenEventObject < Internal::Types::Model
    field :card, Square::CardForgottenEventCard, optional: true, nullable: false

  end
end
