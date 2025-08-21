# frozen_string_literal: true

module Square
  module Types
    class CardForgottenEventObject < Internal::Types::Model
      field :card, -> { Square::Types::CardForgottenEventCard }, optional: true, nullable: false
    end
  end
end
