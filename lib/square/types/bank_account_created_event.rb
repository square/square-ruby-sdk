# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    # Published when you link an external bank account to a Square
    # account in the Seller Dashboard. Square sets the initial status to
    # `VERIFICATION_IN_PROGRESS` and publishes the event.
    class BankAccountCreatedEvent < Internal::Types::Model
      field :merchant_id, -> { String }, optional: true, nullable: true

      field :location_id, -> { String }, optional: true, nullable: true

      field :type, -> { String }, optional: true, nullable: true

      field :event_id, -> { String }, optional: true, nullable: true

      field :created_at, -> { String }, optional: true, nullable: false

      field :data, -> { Square::Types::BankAccountCreatedEventData }, optional: true, nullable: false
    end
  end
end
