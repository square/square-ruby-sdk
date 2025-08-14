# frozen_string_literal: true

module Square
    module Types
        class CreateTerminalRefundResponse < Square::Internal::Types::Model
            field :errors, Square::Internal::Types::Array[Square::Error], optional: true, nullable: false
            field :refund, Square::TerminalRefund, optional: true, nullable: false
        end
    end
end
