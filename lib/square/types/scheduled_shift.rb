# frozen_string_literal: true

module Square
  module Types
    # Represents a specific time slot in a work schedule. This object is used to manage the
    # lifecycle of a scheduled shift from the draft to published state. A scheduled shift contains
    # the latest draft shift details and current published shift details.
    class ScheduledShift < Internal::Types::Model
      field :id, -> { String }, optional: true, nullable: false
      field :draft_shift_details, -> { Square::Types::ScheduledShiftDetails }, optional: true, nullable: false
      field :published_shift_details, -> { Square::Types::ScheduledShiftDetails }, optional: true, nullable: false
      field :version, -> { Integer }, optional: true, nullable: false
      field :created_at, -> { String }, optional: true, nullable: false
      field :updated_at, -> { String }, optional: true, nullable: false
    end
  end
end
