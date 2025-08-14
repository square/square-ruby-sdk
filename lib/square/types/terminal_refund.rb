# frozen_string_literal: true

module Square
    module Types
        # Represents a payment refund processed by the Square Terminal. Only supports Interac (Canadian debit network) payment refunds.
        class TerminalRefund < Internal::Types::Model
            field :id, String, optional: true, nullable: false
            field :refund_id, String, optional: true, nullable: false
            field :payment_id, String, optional: false, nullable: false
            field :order_id, String, optional: true, nullable: false
            field :amount_money, Square::Money, optional: false, nullable: false
            field :reason, String, optional: false, nullable: false
            field :device_id, String, optional: false, nullable: false
            field :deadline_duration, String, optional: true, nullable: false
            field :status, String, optional: true, nullable: false
            field :cancel_reason, Square::ActionCancelReason, optional: true, nullable: false
            field :created_at, String, optional: true, nullable: false
            field :updated_at, String, optional: true, nullable: false
            field :app_id, String, optional: true, nullable: false
            field :location_id, String, optional: true, nullable: false
        end
    end
end
