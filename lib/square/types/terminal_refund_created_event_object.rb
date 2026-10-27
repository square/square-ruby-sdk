# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    class TerminalRefundCreatedEventObject < Internal::Types::Model
      field :refund, -> { Square::Types::TerminalRefund }, optional: true, nullable: false
    end
  end
end
