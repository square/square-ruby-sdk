# frozen_string_literal: true

module Square
  module Types
    class TerminalRefundQuery < Internal::Types::Model
      field :filter, -> { Square::Types::TerminalRefundQueryFilter }, optional: true, nullable: false
      field :sort, -> { Square::Types::TerminalRefundQuerySort }, optional: true, nullable: false

    end
  end
end
