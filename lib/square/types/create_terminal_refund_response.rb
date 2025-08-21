# frozen_string_literal: true

module Square
  module Types
    class CreateTerminalRefundResponse < Internal::Types::Model
      field :errors, -> { Internal::Types::Array[Square::Types::Error] }, optional: true, nullable: false
      field :refund, -> { Square::Types::TerminalRefund }, optional: true, nullable: false
    end
  end
end
