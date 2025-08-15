# frozen_string_literal: true

module Square
  class TerminalRefundUpdatedEventObject < Internal::Types::Model
    field :refund, Square::TerminalRefund, optional: true, nullable: false

  end
end
