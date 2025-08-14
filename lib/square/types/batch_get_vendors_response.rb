# frozen_string_literal: true

module Square
    module Types
        # Represents an output from a call to [BulkRetrieveVendors](api-endpoint:Vendors-BulkRetrieveVendors).
        class BatchGetVendorsResponse < Square::Internal::Types::Model
            field :errors, Square::Internal::Types::Array[Square::Types::Error], optional: true, nullable: false
            field :responses, Square::Internal::Types::Hash[String, Square::GetVendorResponse], optional: true, nullable: false
        end
    end
end
