# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    class TerminalActionCreatedEventObject < Internal::Types::Model
      field :action, -> { Square::Types::TerminalAction }, optional: true, nullable: false
    end
  end
end
