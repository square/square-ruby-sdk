
module Square
  module Vendors
    module Types
      class UpdateVendorsRequest < Internal::Types::Model
        field :vendor_id, String, optional: false, nullable: false
        field :body, Square::Types::UpdateVendorRequest, optional: false, nullable: false

      end
    end
  end
end
