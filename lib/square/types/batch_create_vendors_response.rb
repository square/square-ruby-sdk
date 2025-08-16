# frozen_string_literal: true

module Square
  module Types
    # Represents an output from a call to [BulkCreateVendors](api-endpoint:Vendors-BulkCreateVendors).
    class BatchCreateVendorsResponse < Internal::Types::Model
      field :errors, Internal::Types::Array[Square::Error], optional: true, nullable: false
      field :responses, Internal::Types::Hash[String, Square::CreateVendorResponse], optional: true, nullable: false

    end
  end
end
