# frozen_string_literal: true

module Square
    module Types
        class OrderUpdatedObject < Square::Internal::Types::Model
            field :order_updated, Square::OrderUpdated, optional: true, nullable: false
        end
    end
end
