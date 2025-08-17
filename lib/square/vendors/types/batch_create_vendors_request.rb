
module Square
  module Vendors
    module Types
      class BatchCreateVendorsRequest < Internal::Types::Model
        field :vendors, Internal::Types::Hash[String, Square::Types::Vendor], optional: false, nullable: false

      end
    end
  end
end
