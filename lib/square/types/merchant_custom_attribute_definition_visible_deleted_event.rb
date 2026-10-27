# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    # Published when a merchant [custom attribute definition](entity:CustomAttributeDefinition)
    # that is visible to the subscribing application is deleted. A notification is sent when your application
    # deletes a custom attribute definition or another application deletes a custom attribute definition whose
    # `visibility` is `VISIBILITY_READ_ONLY` or `VISIBILITY_READ_WRITE_VALUES`.
    class MerchantCustomAttributeDefinitionVisibleDeletedEvent < Internal::Types::Model
      field :merchant_id, -> { String }, optional: true, nullable: true

      field :type, -> { String }, optional: true, nullable: true

      field :event_id, -> { String }, optional: true, nullable: true

      field :created_at, -> { String }, optional: true, nullable: false

      field :data, -> { Square::Types::CustomAttributeDefinitionEventData }, optional: true, nullable: false
    end
  end
end
