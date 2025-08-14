# frozen_string_literal: true

module Square
    module Types
        class TerminalActionQuery < Square::Internal::Types::Model
            field :filter, Square::TerminalActionQueryFilter, optional: true, nullable: false
            field :sort, Square::TerminalActionQuerySort, optional: true, nullable: false
        end
    end
end
