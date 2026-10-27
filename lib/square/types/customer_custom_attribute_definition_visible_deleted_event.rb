# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    # Published when a customer [custom attribute definition](entity:CustomAttributeDefinition)
    # that is visible to the subscribing application is deleted. A custom attribute definition can only be deleted
    # by the application that created it. A notification is sent when your application deletes a custom attribute
    # definition or when another application deletes a custom attribute definition whose `visibility` is
    # `VISIBILITY_READ_ONLY` or `VISIBILITY_READ_WRITE_VALUES`.
    class CustomerCustomAttributeDefinitionVisibleDeletedEvent < Internal::Types::Model
      field :merchant_id, -> { String }, optional: true, nullable: true

      field :type, -> { String }, optional: true, nullable: true

      field :event_id, -> { String }, optional: true, nullable: true

      field :created_at, -> { String }, optional: true, nullable: false

      field :data, -> { Square::Types::CustomAttributeDefinitionEventData }, optional: true, nullable: false
    end
  end
end
