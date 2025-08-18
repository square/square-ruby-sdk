# frozen_string_literal: true

module Square
  module Types
    class CheckoutLocationSettingsTipping < Internal::Types::Model
      field :percentages, Internal::Types::Array[Integer], optional: true, nullable: false
      field :smart_tipping_enabled, Internal::Types::Boolean, optional: true, nullable: false
      field :default_percent, Integer, optional: true, nullable: false
      field :smart_tips, Internal::Types::Array[Square::Types::Money], optional: true, nullable: false
      field :default_smart_tip, Square::Types::Money, optional: true, nullable: false

    end
  end
end
