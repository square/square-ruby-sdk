# frozen_string_literal: true

module Square
    module Types
        # Represents an output from a call to [RetrieveVendor](api-endpoint:Vendors-RetrieveVendor).
        class GetVendorResponse < Internal::Types::Model
            field :errors, Internal::Types::Array[Square::Error], optional: true, nullable: false
            field :vendor, Square::Vendor, optional: true, nullable: false
        end
    end
end
