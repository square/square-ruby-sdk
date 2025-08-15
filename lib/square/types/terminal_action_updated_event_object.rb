# frozen_string_literal: true

module Square
  class TerminalActionUpdatedEventObject < Internal::Types::Model
    field :action, Square::TerminalAction, optional: true, nullable: false

  end
end
