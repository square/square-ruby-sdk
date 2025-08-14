# frozen_string_literal: true

module Square
    module Types
        # Published when a location [custom attribute definition](entity:CustomAttributeDefinition) 
        # that is visible to the subscribing application is updated. A custom attribute definition can only be updated
        # by the application that created it. A notification is sent when your application updates a custom attribute 
        # definition or when another application updates a custom attribute definition whose `visibility` is 
        # `VISIBILITY_READ_ONLY` or `VISIBILITY_READ_WRITE_VALUES`.
        class LocationCustomAttributeDefinitionVisibleUpdatedEvent < Internal::Types::Model
            field :merchant_id, String, optional: true, nullable: false
            field :type, String, optional: true, nullable: false
            field :event_id, String, optional: true, nullable: false
            field :created_at, String, optional: true, nullable: false
            field :data, Square::CustomAttributeDefinitionEventData, optional: true, nullable: false
        end
    end
end
