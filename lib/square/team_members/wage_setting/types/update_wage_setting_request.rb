
module Square
  module TeamMembers
    module WageSetting
      module Types
        class UpdateWageSettingRequest < Internal::Types::Model
          field :team_member_id, String, optional: false, nullable: false
          field :wage_setting, Square::Types::WageSetting, optional: false, nullable: false

        end
      end
    end
  end
end
