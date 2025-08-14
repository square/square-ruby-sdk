# frozen_string_literal: true

module Square
    module Types
        class UpdatePaymentLinkResponse < Square::Internal::Types::Model
            field :errors, Square::Internal::Types::Array[Square::Types::Error], optional: true, nullable: false
            field :payment_link, Square::PaymentLink, optional: true, nullable: false
        end
    end
end
