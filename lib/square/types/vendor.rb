# frozen_string_literal: true

module Square
  # Represents a supplier to a seller.
  class Vendor < Internal::Types::Model
    field :id, String, optional: true, nullable: false
    field :created_at, String, optional: true, nullable: false
    field :updated_at, String, optional: true, nullable: false
    field :name, String, optional: true, nullable: false
    field :address, Square::Address, optional: true, nullable: false
    field :contacts, Internal::Types::Array[Square::VendorContact], optional: true, nullable: false
    field :account_number, String, optional: true, nullable: false
    field :note, String, optional: true, nullable: false
    field :version, Integer, optional: true, nullable: false
    field :status, Square::VendorStatus, optional: true, nullable: false

  end
end
