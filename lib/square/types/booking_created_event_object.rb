# frozen_string_literal: true

module Square
  module Types
    class BookingCreatedEventObject < Internal::Types::Model
      field :booking, Square::Types::Booking, optional: true, nullable: false

    end
  end
end
