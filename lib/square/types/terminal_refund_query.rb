# frozen_string_literal: true

module Square
  class TerminalRefundQuery < Internal::Types::Model
    field :filter, Square::TerminalRefundQueryFilter, optional: true, nullable: false
    field :sort, Square::TerminalRefundQuerySort, optional: true, nullable: false

  end
end
