# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    # A query filter to search for buyer-accessible availabilities by.
    class SearchAvailabilityFilter < Internal::Types::Model
      field :start_at_range, -> { Square::Types::TimeRange }, optional: false, nullable: false

      field :location_id, -> { String }, optional: true, nullable: true

      field :segment_filters, -> { Internal::Types::Array[Square::Types::SegmentFilter] }, optional: true, nullable: true

      field :booking_id, -> { String }, optional: true, nullable: true
    end
  end
end
