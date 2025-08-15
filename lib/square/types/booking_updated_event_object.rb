# frozen_string_literal: true

module Square
  class BookingUpdatedEventObject < Internal::Types::Model
    field :booking, Square::Booking, optional: true, nullable: false

  end
end
