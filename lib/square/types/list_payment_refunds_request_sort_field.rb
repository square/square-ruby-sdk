# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    module ListPaymentRefundsRequestSortField
      extend Square::Internal::Types::Enum

      CREATED_AT = "CREATED_AT"
      UPDATED_AT = "UPDATED_AT"
    end
  end
end
