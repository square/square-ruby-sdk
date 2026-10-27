# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    # Published when a customer [custom attribute definition](entity:CustomAttributeDefinition)
    # created by the subscribing application is updated. A custom attribute definition can only be updated by
    # the application that created it.
    class CustomerCustomAttributeDefinitionOwnedUpdatedEvent < Internal::Types::Model
      field :merchant_id, -> { String }, optional: true, nullable: true

      field :type, -> { String }, optional: true, nullable: true

      field :event_id, -> { String }, optional: true, nullable: true

      field :created_at, -> { String }, optional: true, nullable: false

      field :data, -> { Square::Types::CustomAttributeDefinitionEventData }, optional: true, nullable: false
    end
  end
end
