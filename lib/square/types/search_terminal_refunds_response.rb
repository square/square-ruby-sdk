# frozen_string_literal: true

module Square
  module Types
    class SearchTerminalRefundsResponse < Internal::Types::Model
      field :errors, Internal::Types::Array[Square::Error], optional: true, nullable: false
      field :refunds, Internal::Types::Array[Square::TerminalRefund], optional: true, nullable: false
      field :cursor, String, optional: true, nullable: false

    end
  end
end
