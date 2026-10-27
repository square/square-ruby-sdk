# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    # Criteria to filter events by.
    class SearchEventsFilter < Internal::Types::Model
      field :event_types, -> { Internal::Types::Array[String] }, optional: true, nullable: true

      field :merchant_ids, -> { Internal::Types::Array[String] }, optional: true, nullable: true

      field :location_ids, -> { Internal::Types::Array[String] }, optional: true, nullable: true

      field :created_at, -> { Square::Types::TimeRange }, optional: true, nullable: false
    end
  end
end
