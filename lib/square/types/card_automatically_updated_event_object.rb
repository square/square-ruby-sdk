# frozen_string_literal: true

module Square
  module Types
    class CardAutomaticallyUpdatedEventObject < Internal::Types::Model
      field :card, Square::Types::Card, optional: true, nullable: false

    end
  end
end
