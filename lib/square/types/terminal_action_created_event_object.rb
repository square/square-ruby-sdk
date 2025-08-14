# frozen_string_literal: true

module Square
    module Types
        class TerminalActionCreatedEventObject < Square::Internal::Types::Model
            field :action, Square::TerminalAction, optional: true, nullable: false
        end
    end
end
