# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    # Filter by the current order `state`.
    class SearchOrdersStateFilter < Internal::Types::Model
      field :states, -> { Internal::Types::Array[Square::Types::OrderState] }, optional: false, nullable: false
    end
  end
end
