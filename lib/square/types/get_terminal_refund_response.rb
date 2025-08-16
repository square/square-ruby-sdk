# frozen_string_literal: true

module Square
  module Types
    class GetTerminalRefundResponse < Internal::Types::Model
      field :errors, Internal::Types::Array[Square::Error], optional: true, nullable: false
      field :refund, Square::TerminalRefund, optional: true, nullable: false

    end
  end
end
