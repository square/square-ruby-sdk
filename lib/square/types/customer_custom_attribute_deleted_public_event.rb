# frozen_string_literal: true

module Square
  module Types
    # Published when a customer [custom attribute](entity:CustomAttribute) that is visible
    # to all applications is deleted. A notification is sent when any application deletes a custom attribute
    # whose `visibility` is `VISIBILITY_READ_ONLY` or `VISIBILITY_READ_WRITE_VALUES`.
    # 
    # This event is replaced by 
    # [customer.custom_attribute.visible.deleted](webhook:customer.custom_attribute.visible.deleted),
    # which applies to custom attributes that are visible to the subscribing application.
    class CustomerCustomAttributeDeletedPublicEvent < Internal::Types::Model
      field :merchant_id, String, optional: true, nullable: false
      field :type, String, optional: true, nullable: false
      field :event_id, String, optional: true, nullable: false
      field :created_at, String, optional: true, nullable: false
      field :data, Square::CustomAttributeEventData, optional: true, nullable: false

    end
  end
end
