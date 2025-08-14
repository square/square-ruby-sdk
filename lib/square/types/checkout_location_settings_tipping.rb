# frozen_string_literal: true

module Square
    module Types
        class CheckoutLocationSettingsTipping < Square::Internal::Types::Model
            field :percentages, Square::Internal::Types::Array[Integer], optional: true, nullable: false
            field :smart_tipping_enabled, Square::Internal::Types::Boolean, optional: true, nullable: false
            field :default_percent, Integer, optional: true, nullable: false
            field :smart_tips, Square::Internal::Types::Array[Square::Money], optional: true, nullable: false
            field :default_smart_tip, Square::Money, optional: true, nullable: false
        end
    end
end
