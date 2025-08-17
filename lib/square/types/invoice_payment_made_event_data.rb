# frozen_string_literal: true

module Square
  module Types
    class InvoicePaymentMadeEventData < Internal::Types::Model
      field :type, String, optional: true, nullable: false
      field :id, String, optional: true, nullable: false
      field :object, Square::Types::InvoicePaymentMadeEventObject, optional: true, nullable: false

    end
  end
end
