# frozen_string_literal: true

module Square
  # An object that contains the customer associated with the event.
  class CustomerCreatedEventObject < Internal::Types::Model
    field :customer, Square::Customer, optional: true, nullable: false
    field :event_context, Square::CustomerCreatedEventEventContext, optional: true, nullable: false

  end
end
