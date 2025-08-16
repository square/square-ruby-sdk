# frozen_string_literal: true

module Square
  module Types
    # The data associated with a `loyalty.account.deleted` event.
    class LoyaltyAccountDeletedEventData < Internal::Types::Model
      field :type, String, optional: true, nullable: false
      field :id, String, optional: true, nullable: false
      field :object, Square::LoyaltyAccountDeletedEventObject, optional: true, nullable: false

    end
  end
end
