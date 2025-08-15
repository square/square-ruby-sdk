# frozen_string_literal: true

module Square
  # An object that contains the customer associated with the event.
  class CustomerUpdatedEventObject < Internal::Types::Model
    field :customer, Square::Customer, optional: true, nullable: false

  end
end
