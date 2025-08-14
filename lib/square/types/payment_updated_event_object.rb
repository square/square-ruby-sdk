# frozen_string_literal: true

module Square
    module Types
        class PaymentUpdatedEventObject < Square::Internal::Types::Model
            field :payment, Square::Payment, optional: true, nullable: false
        end
    end
end
