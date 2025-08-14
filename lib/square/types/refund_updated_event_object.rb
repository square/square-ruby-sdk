# frozen_string_literal: true

module Square
    module Types
        class RefundUpdatedEventObject < Square::Internal::Types::Model
            field :refund, Square::PaymentRefund, optional: true, nullable: false
        end
    end
end
