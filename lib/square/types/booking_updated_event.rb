# frozen_string_literal: true

module Square
  module Types
    # Published when a booking is updated or cancelled.
    #
    # To receive this event with buyer-level permissions, you must have `APPOINTMENTS_READ` set for the OAuth scope.
    # To receive this event with seller-level permissions, you must have `APPOINTMENTS_ALL_READ` and `APPOINTMENTS_READ`
    # set for the OAuth scope.
    class BookingUpdatedEvent < Internal::Types::Model
      field :merchant_id, -> { String }, optional: true, nullable: false
      field :type, -> { String }, optional: true, nullable: false
      field :event_id, -> { String }, optional: true, nullable: false
      field :created_at, -> { String }, optional: true, nullable: false
      field :data, -> { Square::Types::BookingUpdatedEventData }, optional: true, nullable: false
    end
  end
end
