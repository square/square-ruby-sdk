# frozen_string_literal: true

module Square
  module Types
    # Published when Square automatically updates the expiration date or
    # primary account number (PAN) of a [card](entity:Card) or adds or removes an issuer alert.
    class CardAutomaticallyUpdatedEvent < Internal::Types::Model
      field :merchant_id, String, optional: true, nullable: false
      field :type, String, optional: true, nullable: false
      field :event_id, String, optional: true, nullable: false
      field :created_at, String, optional: true, nullable: false
      field :data, Square::Types::CardAutomaticallyUpdatedEventData, optional: true, nullable: false

    end
  end
end
