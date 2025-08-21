# frozen_string_literal: true

module Square
  module Types
    # Represents a response from a retrieve request containing the specified `WageSetting` object or error messages.
    class GetWageSettingResponse < Internal::Types::Model
      field :wage_setting, -> { Square::Types::WageSetting }, optional: true, nullable: false
      field :errors, -> { Internal::Types::Array[Square::Types::Error] }, optional: true, nullable: false
    end
  end
end
