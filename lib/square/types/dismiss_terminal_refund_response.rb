# frozen_string_literal: true

module Square
  class DismissTerminalRefundResponse < Internal::Types::Model
    field :errors, Internal::Types::Array[Square::Error], optional: true, nullable: false
    field :refund, Square::TerminalRefund, optional: true, nullable: false

  end
end
