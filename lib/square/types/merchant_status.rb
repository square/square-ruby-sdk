# frozen_string_literal: true

module Square
  module Types
    module MerchantStatus
      extend Square::Internal::Types::Enum

      ACTIVE = "ACTIVE"
      INACTIVE = "INACTIVE"
    end
  end
end
