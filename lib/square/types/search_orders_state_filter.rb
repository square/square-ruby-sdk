# frozen_string_literal: true

module Square
  # Filter by the current order `state`.
  class SearchOrdersStateFilter < Internal::Types::Model
    field :states, Internal::Types::Array[Square::OrderState], optional: false, nullable: false

  end
end
