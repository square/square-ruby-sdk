# frozen_string_literal: true

module Square
    module Types
        # Represents an output from a call to [BulkUpdateVendors](api-endpoint:Vendors-BulkUpdateVendors).
        class BatchUpdateVendorsResponse < Square::Internal::Types::Model
            field :errors, Square::Internal::Types::Array[Square::Error], optional: true, nullable: false
            field :responses, Square::Internal::Types::Hash[String, Square::UpdateVendorResponse], optional: true, nullable: false
        end
    end
end
