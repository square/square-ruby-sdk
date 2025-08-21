# frozen_string_literal: true

module Square
  module Types
    # Represents an output from a call to [BulkRetrieveVendors](api-endpoint:Vendors-BulkRetrieveVendors).
    class BatchGetVendorsResponse < Internal::Types::Model
      field :errors, -> { Internal::Types::Array[Square::Types::Error] }, optional: true, nullable: false
      field :responses, lambda {
        Internal::Types::Hash[String, Square::Types::GetVendorResponse]
      }, optional: true, nullable: false
    end
  end
end
