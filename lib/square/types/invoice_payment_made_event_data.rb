# frozen_string_literal: true

module Square
  class InvoicePaymentMadeEventData < Internal::Types::Model
    field :type, String, optional: true, nullable: false
    field :id, String, optional: true, nullable: false
    field :object, Square::InvoicePaymentMadeEventObject, optional: true, nullable: false

  end
end
