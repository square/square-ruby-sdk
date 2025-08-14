# frozen_string_literal: true

module Square
    module Types
        class SearchTerminalActionsResponse < Square::Internal::Types::Model
            field :errors, Square::Internal::Types::Array[Square::Types::Error], optional: true, nullable: false
            field :action, Square::Internal::Types::Array[Square::TerminalAction], optional: true, nullable: false
            field :cursor, String, optional: true, nullable: false
        end
    end
end
