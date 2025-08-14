# frozen_string_literal: true

module Square
  module Types
    # Represents a response from an update request containing the updated `WageSetting` object
    # or error messages.
    class UpdateWageSettingResponse < Internal::Types::Model
      field :wage_setting, Square::WageSetting, optional: true, nullable: false
      field :errors, Internal::Types::Array[Square::Error], optional: true, nullable: false

    end
  end
end
