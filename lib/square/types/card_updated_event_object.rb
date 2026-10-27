# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    class CardUpdatedEventObject < Internal::Types::Model
      field :card, -> { Square::Types::Card }, optional: true, nullable: false
    end
  end
end
