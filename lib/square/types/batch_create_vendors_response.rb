# frozen_string_literal: true

module Square
    module Types
        # Represents an output from a call to [BulkCreateVendors](api-endpoint:Vendors-BulkCreateVendors).
        class BatchCreateVendorsResponse < Square::Internal::Types::Model
            field :errors, Square::Internal::Types::Array[Square::Error], optional: true, nullable: false
            field :responses, Square::Internal::Types::Hash[String, Square::CreateVendorResponse], optional: true, nullable: false
        end
    end
end
