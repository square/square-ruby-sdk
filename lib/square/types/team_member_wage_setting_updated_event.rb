# frozen_string_literal: true

module Square
  # Published when a Wage Setting is updated.
  class TeamMemberWageSettingUpdatedEvent < Internal::Types::Model
    field :merchant_id, String, optional: true, nullable: false
    field :type, String, optional: true, nullable: false
    field :event_id, String, optional: true, nullable: false
    field :created_at, String, optional: true, nullable: false
    field :data, Square::TeamMemberWageSettingUpdatedEventData, optional: true, nullable: false

  end
end
