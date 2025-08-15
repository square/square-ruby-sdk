# frozen_string_literal: true

module Square
  class InvoiceScheduledChargeFailedEventData < Internal::Types::Model
    field :type, String, optional: true, nullable: false
    field :id, String, optional: true, nullable: false
    field :object, Square::InvoiceScheduledChargeFailedEventObject, optional: true, nullable: false

  end
end
