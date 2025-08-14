# frozen_string_literal: true

module Square
    module Types
        class TerminalActionQuerySort < Square::Internal::Types::Model
            field :sort_order, Square::SortOrder, optional: true, nullable: false
        end
    end
end
