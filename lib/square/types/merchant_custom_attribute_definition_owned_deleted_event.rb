# frozen_string_literal: true

module Square
    module Types
        # Published when a merchant [custom attribute definition](entity:CustomAttributeDefinition)
        # is deleted by the subscribing application. Subscribe to this event to be notified
        # when your application deletes a merchant custom attribute definition.
        class MerchantCustomAttributeDefinitionOwnedDeletedEvent < Internal::Types::Model
            field :merchant_id, String, optional: true, nullable: false
            field :type, String, optional: true, nullable: false
            field :event_id, String, optional: true, nullable: false
            field :created_at, String, optional: true, nullable: false
            field :data, Square::CustomAttributeDefinitionEventData, optional: true, nullable: false
        end
    end
end
