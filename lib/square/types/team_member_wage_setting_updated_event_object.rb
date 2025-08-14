# frozen_string_literal: true

module Square
    module Types
        class TeamMemberWageSettingUpdatedEventObject < Square::Internal::Types::Model
            field :wage_setting, Square::WageSetting, optional: true, nullable: false
        end
    end
end
