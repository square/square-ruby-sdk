# frozen_string_literal: true

module Square
  module Types
    # Represents an output from a call to [SearchVendors](api-endpoint:Vendors-SearchVendors).
    class SearchVendorsResponse < Internal::Types::Model
      field :errors, Internal::Types::Array[Square::Error], optional: true, nullable: false
      field :vendors, Internal::Types::Array[Square::Vendor], optional: true, nullable: false
      field :cursor, String, optional: true, nullable: false

    end
  end
end
