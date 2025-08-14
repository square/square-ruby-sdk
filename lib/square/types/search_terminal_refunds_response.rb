# frozen_string_literal: true

module Square
    module Types
        class SearchTerminalRefundsResponse < Square::Internal::Types::Model
            field :errors, Square::Internal::Types::Array[Square::Types::Error], optional: true, nullable: false
            field :refunds, Square::Internal::Types::Array[Square::TerminalRefund], optional: true, nullable: false
            field :cursor, String, optional: true, nullable: false
        end
    end
end
