# frozen_string_literal: true

module Square
  module Types
    class SearchTerminalActionsResponse < Internal::Types::Model
      field :errors, -> { Internal::Types::Array[Square::Types::Error] }, optional: true, nullable: false
      field :action, -> { Internal::Types::Array[Square::Types::TerminalAction] }, optional: true, nullable: false
      field :cursor, -> { String }, optional: true, nullable: false

    end
  end
end
