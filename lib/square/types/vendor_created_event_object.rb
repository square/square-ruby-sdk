# frozen_string_literal: true

module Square
  module Types
    class VendorCreatedEventObject < Internal::Types::Model
      field :operation, String, optional: true, nullable: false
      field :vendor, Square::Vendor, optional: true, nullable: false

    end
  end
end
