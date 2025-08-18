# frozen_string_literal: true

module Square
  module Types
    # Published when a location [custom attribute definition](entity:CustomAttributeDefinition) 
    # created by the subscribing application is deleted. A custom attribute definition can only be deleted by 
    # the application that created it.
    class LocationCustomAttributeDefinitionOwnedDeletedEvent < Internal::Types::Model
      field :merchant_id, String, optional: true, nullable: false
      field :type, String, optional: true, nullable: false
      field :event_id, String, optional: true, nullable: false
      field :created_at, String, optional: true, nullable: false
      field :data, Square::Types::CustomAttributeDefinitionEventData, optional: true, nullable: false

    end
  end
end
