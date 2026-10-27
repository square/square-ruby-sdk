# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    # The hourly wage rate used to compensate a team member for a [timecard](entity:Timecard).
    class TimecardWage < Internal::Types::Model
      field :title, -> { String }, optional: true, nullable: true

      field :hourly_rate, -> { Square::Types::Money }, optional: true, nullable: false

      field :job_id, -> { String }, optional: true, nullable: false

      field :tip_eligible, -> { Internal::Types::Boolean }, optional: true, nullable: true
    end
  end
end
