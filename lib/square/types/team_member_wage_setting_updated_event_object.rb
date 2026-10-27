# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    class TeamMemberWageSettingUpdatedEventObject < Internal::Types::Model
      field :wage_setting, -> { Square::Types::WageSetting }, optional: true, nullable: false
    end
  end
end
