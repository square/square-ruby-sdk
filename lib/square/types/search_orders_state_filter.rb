# frozen_string_literal: true

module Square
    module Types
        # Filter by the current order `state`.
        class SearchOrdersStateFilter < Square::Internal::Types::Model
            field :states, Square::Internal::Types::Array[Square::OrderState], optional: false, nullable: false
        end
    end
end
