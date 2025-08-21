# frozen_string_literal: true

module Square
  module Types
    class TerminalRefundQuerySort < Internal::Types::Model
      field :sort_order, -> { String }, optional: true, nullable: false
    end
  end
end
