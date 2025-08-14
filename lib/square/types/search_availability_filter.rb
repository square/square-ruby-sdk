# frozen_string_literal: true

module Square
    module Types
        # A query filter to search for buyer-accessible availabilities by.
        class SearchAvailabilityFilter < Internal::Types::Model
            field :start_at_range, Square::TimeRange, optional: false, nullable: false
            field :location_id, String, optional: true, nullable: false
            field :segment_filters, Internal::Types::Array[Square::SegmentFilter], optional: true, nullable: false
            field :booking_id, String, optional: true, nullable: false
        end
    end
end
