# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    # Defines supported query expressions to search for vendors by.
    class SearchVendorsRequestFilter < Internal::Types::Model
      field :name, -> { Internal::Types::Array[String] }, optional: true, nullable: true

      field :status, -> { Internal::Types::Array[Square::Types::VendorStatus] }, optional: true, nullable: true
    end
  end
end
