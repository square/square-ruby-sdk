# frozen_string_literal: true

module Square
    module Types
        class RefundUpdatedEventObject < Internal::Types::Model
            field :refund, Square::PaymentRefund, optional: true, nullable: false
        end
    end
end
