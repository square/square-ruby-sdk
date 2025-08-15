# frozen_string_literal: true

module Square
  # Published when a customer [custom attribute definition](entity:CustomAttributeDefinition)
  # created by the subscribing application is updated. A custom attribute definition can only be updated by
  # the application that created it.
  # 
  # This event is replaced by 
  # [customer.custom_attribute_definition.owned.updated](webhook:customer.custom_attribute_definition.owned.updated).
  class CustomerCustomAttributeDefinitionUpdatedEvent < Internal::Types::Model
    field :merchant_id, String, optional: true, nullable: false
    field :type, String, optional: true, nullable: false
    field :event_id, String, optional: true, nullable: false
    field :created_at, String, optional: true, nullable: false
    field :data, Square::CustomAttributeDefinitionEventData, optional: true, nullable: false

  end
end
