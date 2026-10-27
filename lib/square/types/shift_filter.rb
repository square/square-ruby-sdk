# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    # Defines a filter used in a search for `Shift` records. `AND` logic is
    # used by Square's servers to apply each filter property specified.
    #
    # Deprecated at Square API version 2025-05-21. See the [migration
    # notes](https://developer.squareup.com/docs/labor-api/what-it-does#migration-notes).
    class ShiftFilter < Internal::Types::Model
      field :location_ids, -> { Internal::Types::Array[String] }, optional: true, nullable: true

      field :employee_ids, -> { Internal::Types::Array[String] }, optional: true, nullable: true

      field :status, -> { Square::Types::ShiftFilterStatus }, optional: true, nullable: false

      field :start, -> { Square::Types::TimeRange }, optional: true, nullable: false

      field :end_, -> { Square::Types::TimeRange }, optional: true, nullable: false, api_name: "end"

      field :workday, -> { Square::Types::ShiftWorkday }, optional: true, nullable: false

      field :team_member_ids, -> { Internal::Types::Array[String] }, optional: true, nullable: true
    end
  end
end
