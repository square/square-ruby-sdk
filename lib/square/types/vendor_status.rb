# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    module VendorStatus
      extend Square::Internal::Types::Enum

      ACTIVE = "ACTIVE"
      INACTIVE = "INACTIVE"
    end
  end
end
