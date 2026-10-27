# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    # An object that contains the customer associated with the event.
    class CustomerUpdatedEventObject < Internal::Types::Model
      field :customer, -> { Square::Types::Customer }, optional: true, nullable: false
    end
  end
end
