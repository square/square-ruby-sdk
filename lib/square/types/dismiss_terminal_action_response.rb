# frozen_string_literal: true

module Square
    module Types
        class DismissTerminalActionResponse < Square::Internal::Types::Model
            field :errors, Square::Internal::Types::Array[Square::Error], optional: true, nullable: false
            field :action, Square::TerminalAction, optional: true, nullable: false
        end
    end
end
