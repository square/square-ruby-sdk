# frozen_string_literal: true

module Square
    module Types
        # Represents a response from a retrieve request containing the specified `WageSetting` object or error messages.
        class GetWageSettingResponse < Square::Internal::Types::Model
            field :wage_setting, Square::WageSetting, optional: true, nullable: false
            field :errors, Square::Internal::Types::Array[Square::Types::Error], optional: true, nullable: false
        end
    end
end
