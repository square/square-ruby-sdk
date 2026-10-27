# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    class VendorUpdatedEventObject < Internal::Types::Model
      field :operation, -> { String }, optional: true, nullable: false

      field :vendor, -> { Square::Types::Vendor }, optional: true, nullable: false
    end
  end
end
