# frozen_string_literal: true

module Square
  # Defines the `vendor.created` event data structure.
  class VendorCreatedEventData < Internal::Types::Model
    field :type, String, optional: true, nullable: false
    field :id, String, optional: true, nullable: false
    field :object, Square::VendorCreatedEventObject, optional: true, nullable: false

  end
end
