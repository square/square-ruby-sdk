# frozen_string_literal: true

module Square
    module Types
        class InvoiceCanceledEventData < Internal::Types::Model
            field :type, String, optional: true, nullable: false
            field :id, String, optional: true, nullable: false
            field :object, Square::InvoiceCanceledEventObject, optional: true, nullable: false
        end
    end
end
