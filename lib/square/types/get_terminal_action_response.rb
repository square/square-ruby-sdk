# frozen_string_literal: true

module Square
  class GetTerminalActionResponse < Internal::Types::Model
    field :errors, Internal::Types::Array[Square::Error], optional: true, nullable: false
    field :action, Square::TerminalAction, optional: true, nullable: false

  end
end
