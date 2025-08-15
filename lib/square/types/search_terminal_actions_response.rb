# frozen_string_literal: true

module Square
  class SearchTerminalActionsResponse < Internal::Types::Model
    field :errors, Internal::Types::Array[Square::Error], optional: true, nullable: false
    field :action, Internal::Types::Array[Square::TerminalAction], optional: true, nullable: false
    field :cursor, String, optional: true, nullable: false

  end
end
