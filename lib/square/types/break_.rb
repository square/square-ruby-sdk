# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    # A record of a team member's break on a [timecard](entity:Timecard).
    class Break < Internal::Types::Model
      field :id, -> { String }, optional: true, nullable: false

      field :start_at, -> { String }, optional: false, nullable: false

      field :end_at, -> { String }, optional: true, nullable: true

      field :break_type_id, -> { String }, optional: false, nullable: false

      field :name, -> { String }, optional: false, nullable: false

      field :expected_duration, -> { String }, optional: false, nullable: false

      field :is_paid, -> { Internal::Types::Boolean }, optional: false, nullable: false
    end
  end
end
