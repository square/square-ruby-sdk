# frozen_string_literal: true

module Square
  module Types
    # The hourly wage rate used to compensate an employee for this shift.
    #
    # Deprecated at Square API version 2025-05-21. See the [migration
    # notes](https://developer.squareup.com/docs/labor-api/what-it-does#migration-notes).
    class ShiftWage < Internal::Types::Model
      field :title, -> { String }, optional: true, nullable: false
      field :hourly_rate, -> { Square::Types::Money }, optional: true, nullable: false
      field :job_id, -> { String }, optional: true, nullable: false
      field :tip_eligible, -> { Internal::Types::Boolean }, optional: true, nullable: false
    end
  end
end
