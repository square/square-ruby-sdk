# frozen_string_literal: true

module Square
  class RefundCreatedEventData < Internal::Types::Model
    field :type, String, optional: true, nullable: false
    field :id, String, optional: true, nullable: false
    field :object, Square::RefundCreatedEventObject, optional: true, nullable: false

  end
end
