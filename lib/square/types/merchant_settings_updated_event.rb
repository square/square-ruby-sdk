# frozen_string_literal: true

module Square
  module Types
    # Published when online checkout merchant settings are updated
    class MerchantSettingsUpdatedEvent < Internal::Types::Model
      field :merchant_id, String, optional: true, nullable: false
      field :type, String, optional: true, nullable: false
      field :event_id, String, optional: true, nullable: false
      field :created_at, String, optional: true, nullable: false
      field :data, Square::MerchantSettingsUpdatedEventData, optional: true, nullable: false

    end
  end
end
