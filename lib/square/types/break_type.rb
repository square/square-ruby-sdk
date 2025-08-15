# frozen_string_literal: true

module Square
  # A template for a type of [break](entity:Break) that can be added to a
  # [timecard](entity:Timecard), including the expected duration and paid status.
  class BreakType < Internal::Types::Model
    field :id, String, optional: true, nullable: false
    field :location_id, String, optional: false, nullable: false
    field :break_name, String, optional: false, nullable: false
    field :expected_duration, String, optional: false, nullable: false
    field :is_paid, Internal::Types::Boolean, optional: false, nullable: false
    field :version, Integer, optional: true, nullable: false
    field :created_at, String, optional: true, nullable: false
    field :updated_at, String, optional: true, nullable: false

  end
end
