# frozen_string_literal: true

module Square
  module Types
    # Represents a contact of a [Vendor](entity:Vendor).
    class VendorContact < Internal::Types::Model
      field :id, String, optional: true, nullable: false
      field :name, String, optional: true, nullable: false
      field :email_address, String, optional: true, nullable: false
      field :phone_number, String, optional: true, nullable: false
      field :removed, Internal::Types::Boolean, optional: true, nullable: false
      field :ordinal, Integer, optional: false, nullable: false

    end
  end
end
