# frozen_string_literal: true

module Square
  # Represents an output from a call to [BulkRetrieveVendors](api-endpoint:Vendors-BulkRetrieveVendors).
  class BatchGetVendorsResponse < Internal::Types::Model
    field :errors, Internal::Types::Array[Square::Error], optional: true, nullable: false
    field :responses, Internal::Types::Hash[String, Square::GetVendorResponse], optional: true, nullable: false

  end
end
