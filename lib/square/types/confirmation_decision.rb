# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    class ConfirmationDecision < Internal::Types::Model
      field :has_agreed, -> { Internal::Types::Boolean }, optional: true, nullable: false
    end
  end
end
