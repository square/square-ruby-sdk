# frozen_string_literal: true

module Square
  module Types
    # Defines the `vendor.created` event data structure.
    class VendorCreatedEventData < Internal::Types::Model
      field :type, String, optional: true, nullable: false
      field :id, String, optional: true, nullable: false
      field :object, Square::Types::VendorCreatedEventObject, optional: true, nullable: false

    end
  end
end
