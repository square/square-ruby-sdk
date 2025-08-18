
module Square
  module Terminal
    module Actions
      module Types
        class SearchTerminalActionsRequest < Internal::Types::Model
          field :query, Square::Types::TerminalActionQuery, optional: true, nullable: false
          field :cursor, String, optional: true, nullable: false
          field :limit, Integer, optional: true, nullable: false

        end
      end
    end
  end
end
