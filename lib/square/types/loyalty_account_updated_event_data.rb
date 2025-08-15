# frozen_string_literal: true

module Square
  # The data associated with a `loyalty.account.updated` event.
  class LoyaltyAccountUpdatedEventData < Internal::Types::Model
    field :type, String, optional: true, nullable: false
    field :id, String, optional: true, nullable: false
    field :object, Square::LoyaltyAccountUpdatedEventObject, optional: true, nullable: false

  end
end
