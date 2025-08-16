# frozen_string_literal: true

module Square
  module Types
    # Published when a [card](entity:Card) is GDPR forgotten or vaulted.
    class CardForgottenEvent < Internal::Types::Model
      field :merchant_id, String, optional: true, nullable: false
      field :type, String, optional: true, nullable: false
      field :event_id, String, optional: true, nullable: false
      field :created_at, String, optional: true, nullable: false
      field :data, Square::CardForgottenEventData, optional: true, nullable: false

    end
  end
end
