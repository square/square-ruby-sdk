# frozen_string_literal: true

module Square
    module Types
        class DismissTerminalRefundResponse < Square::Internal::Types::Model
            field :errors, Square::Internal::Types::Array[Square::Types::Error], optional: true, nullable: false
            field :refund, Square::TerminalRefund, optional: true, nullable: false
        end
    end
end
