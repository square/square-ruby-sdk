# frozen_string_literal: true

module Square
    module Types
        # Represents a refund of a payment made using Square. Contains information about
        # the original payment and the amount of money refunded.
        class PaymentRefund < Square::Internal::Types::Model
            field :id, String, optional: false, nullable: false
            field :status, String, optional: true, nullable: false
            field :location_id, String, optional: true, nullable: false
            field :unlinked, Square::Internal::Types::Boolean, optional: true, nullable: false
            field :destination_type, String, optional: true, nullable: false
            field :destination_details, Square::DestinationDetails, optional: true, nullable: false
            field :amount_money, Square::Money, optional: false, nullable: false
            field :app_fee_money, Square::Money, optional: true, nullable: false
            field :processing_fee, Square::Internal::Types::Array[Square::ProcessingFee], optional: true, nullable: false
            field :payment_id, String, optional: true, nullable: false
            field :order_id, String, optional: true, nullable: false
            field :reason, String, optional: true, nullable: false
            field :created_at, String, optional: true, nullable: false
            field :updated_at, String, optional: true, nullable: false
            field :team_member_id, String, optional: true, nullable: false
            field :terminal_refund_id, String, optional: true, nullable: false
        end
    end
end
