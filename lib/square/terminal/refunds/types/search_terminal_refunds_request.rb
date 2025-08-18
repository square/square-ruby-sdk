
module Square
  module Terminal
    module Refunds
      module Types
        class SearchTerminalRefundsRequest < Internal::Types::Model
          field :query, Square::Types::TerminalRefundQuery, optional: true, nullable: false
          field :cursor, String, optional: true, nullable: false
          field :limit, Integer, optional: true, nullable: false

        end
      end
    end
  end
end
