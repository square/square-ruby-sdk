# frozen_string_literal: true

module Square
  class BookingCreatedEventObject < Internal::Types::Model
    field :booking, Square::Booking, optional: true, nullable: false

  end
end
