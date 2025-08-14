# frozen_string_literal: true

module Square
    module Types
        class TerminalCheckoutQuery < Internal::Types::Model
            field :filter, Square::TerminalCheckoutQueryFilter, optional: true, nullable: false
            field :sort, Square::TerminalCheckoutQuerySort, optional: true, nullable: false
        end
    end
end
