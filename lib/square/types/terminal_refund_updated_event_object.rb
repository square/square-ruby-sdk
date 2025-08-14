# frozen_string_literal: true

module Square
    module Types
        class TerminalRefundUpdatedEventObject < Square::Internal::Types::Model
            field :refund, Square::TerminalRefund, optional: true, nullable: false
        end
    end
end
