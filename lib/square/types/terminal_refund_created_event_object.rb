# frozen_string_literal: true

module Square
    module Types
        class TerminalRefundCreatedEventObject < Internal::Types::Model
            field :refund, Square::TerminalRefund, optional: true, nullable: false
        end
    end
end
