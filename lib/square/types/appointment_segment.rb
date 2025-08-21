# frozen_string_literal: true

module Square
  module Types
    # Defines an appointment segment of a booking.
    class AppointmentSegment < Internal::Types::Model
      field :duration_minutes, -> { Integer }, optional: true, nullable: false
      field :service_variation_id, -> { String }, optional: true, nullable: false
      field :team_member_id, -> { String }, optional: false, nullable: false
      field :service_variation_version, -> { Integer }, optional: true, nullable: false
      field :intermission_minutes, -> { Integer }, optional: true, nullable: false
      field :any_team_member, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :resource_ids, -> { Internal::Types::Array[String] }, optional: true, nullable: false
    end
  end
end
