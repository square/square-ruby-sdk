# frozen_string_literal: true

module Square
    module Types
        # Defines supported query expressions to search for vendors by.
        class SearchVendorsRequestFilter < Square::Internal::Types::Model
            field :name, Square::Internal::Types::Array[String], optional: true, nullable: false
            field :status, Square::Internal::Types::Array[Square::VendorStatus], optional: true, nullable: false
        end
    end
end
