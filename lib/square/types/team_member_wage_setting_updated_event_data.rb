# frozen_string_literal: true

module Square
    module Types
        class TeamMemberWageSettingUpdatedEventData < Square::Internal::Types::Model
            field :type, String, optional: true, nullable: false
            field :id, String, optional: true, nullable: false
            field :object, Square::TeamMemberWageSettingUpdatedEventObject, optional: true, nullable: false
        end
    end
end
