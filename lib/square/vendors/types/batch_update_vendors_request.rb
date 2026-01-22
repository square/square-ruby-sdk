# frozen_string_literal: true

module Square
  module Vendors
    module Types
      class BatchUpdateVendorsRequest < Internal::Types::Model
        field :vendors, -> { Internal::Types::Hash[String, Square::Types::UpdateVendorRequest] }, optional: false, nullable: false
      end
    end
  end
end
