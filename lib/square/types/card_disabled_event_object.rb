# frozen_string_literal: true

module Square
    module Types
        class CardDisabledEventObject < Internal::Types::Model
            field :card, Square::Card, optional: true, nullable: false
        end
    end
end
