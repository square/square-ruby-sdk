# frozen_string_literal: true

module Square
    module Types
        class CreateTerminalActionResponse < Square::Internal::Types::Model
            field :errors, Square::Internal::Types::Array[Square::Types::Error], optional: true, nullable: false
            field :action, Square::TerminalAction, optional: true, nullable: false
        end
    end
end
