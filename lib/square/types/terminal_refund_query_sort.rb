# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    class TerminalRefundQuerySort < Internal::Types::Model
      field :sort_order, -> { String }, optional: true, nullable: true
    end
  end
end
