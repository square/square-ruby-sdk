# frozen_string_literal: true

module Square
  # Published when a customer [custom attribute definition](entity:CustomAttributeDefinition) 
  # is created by the subscribing application.
  # 
  # This event is replaced by 
  # [customer.custom_attribute_definition.owned.created](webhook:customer.custom_attribute_definition.owned.created).
  class CustomerCustomAttributeDefinitionCreatedEvent < Internal::Types::Model
    field :merchant_id, String, optional: true, nullable: false
    field :type, String, optional: true, nullable: false
    field :event_id, String, optional: true, nullable: false
    field :created_at, String, optional: true, nullable: false
    field :data, Square::CustomAttributeDefinitionEventData, optional: true, nullable: false

  end
end
