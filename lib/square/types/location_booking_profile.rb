# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    # The booking profile of a seller's location, including the location's ID and whether the location is enabled for
    # online booking.
    class LocationBookingProfile < Internal::Types::Model
      field :location_id, -> { String }, optional: true, nullable: true

      field :booking_site_url, -> { String }, optional: true, nullable: true

      field :online_booking_enabled, -> { Internal::Types::Boolean }, optional: true, nullable: true
    end
  end
end
