# frozen_string_literal: true

module Square
    module Types
        # Represents an output from a call to [CreateVendor](api-endpoint:Vendors-CreateVendor).
        class CreateVendorResponse < Square::Internal::Types::Model
            field :errors, Square::Internal::Types::Array[Square::Types::Error], optional: true, nullable: false
            field :vendor, Square::Vendor, optional: true, nullable: false
        end
    end
end
