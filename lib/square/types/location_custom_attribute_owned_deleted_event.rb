# frozen_string_literal: true

module Square
  module Types
    # Published when a location [custom attribute](entity:CustomAttribute) 
    # owned by the subscribing application is deleted. Custom attributes are owned by the
    # application that created the corresponding [custom attribute definition](entity:CustomAttributeDefinition).
    # Custom attributes whose `visibility` is `VISIBILITY_READ_WRITE_VALUES` can be deleted by any application.
    class LocationCustomAttributeOwnedDeletedEvent < Internal::Types::Model
      field :merchant_id, String, optional: true, nullable: false
      field :type, String, optional: true, nullable: false
      field :event_id, String, optional: true, nullable: false
      field :created_at, String, optional: true, nullable: false
      field :data, Square::Types::CustomAttributeEventData, optional: true, nullable: false

    end
  end
end
