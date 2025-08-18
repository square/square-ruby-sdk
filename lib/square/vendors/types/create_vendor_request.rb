
module Square
  module Vendors
    module Types
      class CreateVendorRequest < Internal::Types::Model
        field :idempotency_key, -> { String }, optional: false, nullable: false
        field :vendor, -> { Square::Types::Vendor }, optional: true, nullable: false

      end
    end
  end
end
