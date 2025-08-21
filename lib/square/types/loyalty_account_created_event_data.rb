# frozen_string_literal: true

module Square
  module Types
    # The data associated with a `loyalty.account.created` event.
    class LoyaltyAccountCreatedEventData < Internal::Types::Model
      field :type, -> { String }, optional: true, nullable: false
      field :id, -> { String }, optional: true, nullable: false
      field :object, -> { Square::Types::LoyaltyAccountCreatedEventObject }, optional: true, nullable: false
    end
  end
end
