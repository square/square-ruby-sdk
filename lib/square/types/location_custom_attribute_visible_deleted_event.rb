# frozen_string_literal: true

module Square
    module Types
        # Published when a location [custom attribute](entity:CustomAttribute) that is visible to the
        # subscribing application is deleted. A notification is sent when:
        # - Your application deletes a custom attribute owned by your application, regardless of the `visibility` setting.
        # - Any application deletes a custom attribute whose `visibility` is `VISIBILITY_READ_ONLY`
        # or `VISIBILITY_READ_WRITE_VALUES`.
        # 
        # Custom attributes set to `VISIBILITY_READ_WRITE_VALUES` can be deleted by any application, but those set to
        # `VISIBILITY_READ_ONLY` or `VISIBILITY_HIDDEN` can only be deleted by the owner. Custom attributes are owned
        # by the application that created the corresponding [custom attribute definition](entity:CustomAttributeDefinition).
        class LocationCustomAttributeVisibleDeletedEvent < Internal::Types::Model
            field :merchant_id, String, optional: true, nullable: false
            field :type, String, optional: true, nullable: false
            field :event_id, String, optional: true, nullable: false
            field :created_at, String, optional: true, nullable: false
            field :data, Square::CustomAttributeEventData, optional: true, nullable: false
        end
    end
end
