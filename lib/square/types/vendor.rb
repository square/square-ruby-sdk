# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    # Represents a supplier to a seller.
    class Vendor < Internal::Types::Model
      field :id, -> { String }, optional: true, nullable: false

      field :created_at, -> { String }, optional: true, nullable: false

      field :updated_at, -> { String }, optional: true, nullable: false

      field :name, -> { String }, optional: true, nullable: true

      field :address, -> { Square::Types::Address }, optional: true, nullable: false

      field :contacts, -> { Internal::Types::Array[Square::Types::VendorContact] }, optional: true, nullable: true

      field :account_number, -> { String }, optional: true, nullable: true

      field :note, -> { String }, optional: true, nullable: true

      field :version, -> { Integer }, optional: true, nullable: false

      field :status, -> { Square::Types::VendorStatus }, optional: true, nullable: false
    end
  end
end
