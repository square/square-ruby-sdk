# frozen_string_literal: true

module Square
    module Types
        # Describes a payment request reminder (automatic notification) that Square sends
        # to the customer. You configure a reminder relative to the payment request
        # `due_date`.
        class InvoicePaymentReminder < Square::Internal::Types::Model
            field :uid, String, optional: true, nullable: false
            field :relative_scheduled_days, Integer, optional: true, nullable: false
            field :message, String, optional: true, nullable: false
            field :status, Square::InvoicePaymentReminderStatus, optional: true, nullable: false
            field :sent_at, String, optional: true, nullable: false
        end
    end
end
