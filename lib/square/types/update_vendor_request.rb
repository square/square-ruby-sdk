# frozen_string_literal: true

module Square
    module Types
        # Represents an input to a call to [UpdateVendor](api-endpoint:Vendors-UpdateVendor).
        class UpdateVendorRequest < Square::Internal::Types::Model
            field :idempotency_key, String, optional: true, nullable: false
            field :vendor, Square::Vendor, optional: false, nullable: false
        end
    end
end
