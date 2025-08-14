# frozen_string_literal: true

module Square
    module Types
        class CreatePaymentLinkResponse < Square::Internal::Types::Model
            field :errors, Square::Internal::Types::Array[Square::Error], optional: true, nullable: false
            field :payment_link, Square::PaymentLink, optional: true, nullable: false
            field :related_resources, Square::PaymentLinkRelatedResources, optional: true, nullable: false
        end
    end
end
