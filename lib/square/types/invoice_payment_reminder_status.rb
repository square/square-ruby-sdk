# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    module InvoicePaymentReminderStatus
      extend Square::Internal::Types::Enum

      PENDING = "PENDING"
      NOT_APPLICABLE = "NOT_APPLICABLE"
      SENT = "SENT"
    end
  end
end
