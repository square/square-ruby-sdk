# frozen_string_literal: true

module Square
    module Types
        class DeletePaymentLinkResponse < Square::Internal::Types::Model
            field :errors, Square::Internal::Types::Array[Square::Types::Error], optional: true, nullable: false
            field :id, String, optional: true, nullable: false
            field :cancelled_order_id, String, optional: true, nullable: false
        end
    end
end
