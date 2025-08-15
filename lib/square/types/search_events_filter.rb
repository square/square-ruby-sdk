# frozen_string_literal: true

module Square
  # Criteria to filter events by.
  class SearchEventsFilter < Internal::Types::Model
    field :event_types, Internal::Types::Array[String], optional: true, nullable: false
    field :merchant_ids, Internal::Types::Array[String], optional: true, nullable: false
    field :location_ids, Internal::Types::Array[String], optional: true, nullable: false
    field :created_at, Square::TimeRange, optional: true, nullable: false

  end
end
