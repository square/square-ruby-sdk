# frozen_string_literal: true

module Square
  module Types
    class CreateTerminalActionResponse < Internal::Types::Model
      field :errors, Internal::Types::Array[Square::Types::Error], optional: true, nullable: false
      field :action, Square::Types::TerminalAction, optional: true, nullable: false

    end
  end
end
