# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    # Represents an input to a call to [UpdateVendor](api-endpoint:Vendors-UpdateVendor).
    class UpdateVendorRequest < Internal::Types::Model
      field :idempotency_key, -> { String }, optional: true, nullable: true

      field :vendor, -> { Square::Types::Vendor }, optional: false, nullable: false
    end
  end
end
