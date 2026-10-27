# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    # Represents a contact of a [Vendor](entity:Vendor).
    class VendorContact < Internal::Types::Model
      field :id, -> { String }, optional: true, nullable: false

      field :name, -> { String }, optional: true, nullable: true

      field :email_address, -> { String }, optional: true, nullable: true

      field :phone_number, -> { String }, optional: true, nullable: true

      field :removed, -> { Internal::Types::Boolean }, optional: true, nullable: true

      field :ordinal, -> { Integer }, optional: false, nullable: false
    end
  end
end
