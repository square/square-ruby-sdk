# frozen_string_literal: true

module Square
  module Types
    # An object that contains the customer associated with the event.
    class CustomerCreatedEventObject < Internal::Types::Model
      field :customer, -> { Square::Types::Customer }, optional: true, nullable: false
      field :event_context, -> { Square::Types::CustomerCreatedEventEventContext }, optional: true, nullable: false
    end
  end
end
