# frozen_string_literal: true

module Square
    module Types
        # Represents an output from a call to [SearchVendors](api-endpoint:Vendors-SearchVendors).
        class SearchVendorsResponse < Square::Internal::Types::Model
            field :errors, Square::Internal::Types::Array[Square::Types::Error], optional: true, nullable: false
            field :vendors, Square::Internal::Types::Array[Square::Vendor], optional: true, nullable: false
            field :cursor, String, optional: true, nullable: false
        end
    end
end
