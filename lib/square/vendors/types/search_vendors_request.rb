
module Square
  module Vendors
    module Types
      class SearchVendorsRequest < Internal::Types::Model
        field :filter, Square::Types::SearchVendorsRequestFilter, optional: true, nullable: false
        field :sort, Square::Types::SearchVendorsRequestSort, optional: true, nullable: false
        field :cursor, String, optional: true, nullable: false

      end
    end
  end
end
