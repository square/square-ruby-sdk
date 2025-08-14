# frozen_string_literal: true

module Square
    module Types
        # Published when a Team Member is updated.
        class TeamMemberUpdatedEvent < Internal::Types::Model
            field :merchant_id, String, optional: true, nullable: false
            field :type, String, optional: true, nullable: false
            field :event_id, String, optional: true, nullable: false
            field :created_at, String, optional: true, nullable: false
            field :data, Square::TeamMemberUpdatedEventData, optional: true, nullable: false
        end
    end
end
