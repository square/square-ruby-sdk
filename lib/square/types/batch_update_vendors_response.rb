# frozen_string_literal: true

module Square
  module Types
    # Represents an output from a call to [BulkUpdateVendors](api-endpoint:Vendors-BulkUpdateVendors).
    class BatchUpdateVendorsResponse < Internal::Types::Model
      field :errors, -> { Internal::Types::Array[Square::Types::Error] }, optional: true, nullable: false
      field :responses, lambda {
        Internal::Types::Hash[String, Square::Types::UpdateVendorResponse]
      }, optional: true, nullable: false
    end
  end
end
