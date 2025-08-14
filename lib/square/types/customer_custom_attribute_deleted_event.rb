# frozen_string_literal: true

module Square
  module Types
    # Published when a customer [custom attribute](entity:CustomAttribute) owned by the
    # subscribing application is deleted. Custom attributes are owned by the application that created the
    # corresponding [custom attribute definition](entity:CustomAttributeDefinition). Custom attributes whose
    # `visibility` is `VISIBILITY_READ_WRITE_VALUES` can be deleted by any application.
    # 
    # This event is replaced by 
    # [customer.custom_attribute.owned.deleted](webhook:customer.custom_attribute.owned.deleted).
    class CustomerCustomAttributeDeletedEvent < Internal::Types::Model
      field :merchant_id, String, optional: true, nullable: false
      field :type, String, optional: true, nullable: false
      field :event_id, String, optional: true, nullable: false
      field :created_at, String, optional: true, nullable: false
      field :data, Square::CustomAttributeEventData, optional: true, nullable: false

    end
  end
end
