# frozen_string_literal: true

module Square
  class TerminalRefundCreatedEventData < Internal::Types::Model
    field :type, String, optional: true, nullable: false
    field :id, String, optional: true, nullable: false
    field :object, Square::TerminalRefundCreatedEventObject, optional: true, nullable: false

  end
end
