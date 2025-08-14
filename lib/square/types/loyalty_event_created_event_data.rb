# frozen_string_literal: true

module Square
  module Types
    # The data associated with a `loyalty.event.created` event.
    class LoyaltyEventCreatedEventData < Internal::Types::Model
      field :type, String, optional: true, nullable: false
      field :id, String, optional: true, nullable: false
      field :object, Square::LoyaltyEventCreatedEventObject, optional: true, nullable: false

    end
  end
end
