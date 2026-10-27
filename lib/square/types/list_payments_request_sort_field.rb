# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    module ListPaymentsRequestSortField
      extend Square::Internal::Types::Enum

      CREATED_AT = "CREATED_AT"
      OFFLINE_CREATED_AT = "OFFLINE_CREATED_AT"
      UPDATED_AT = "UPDATED_AT"
    end
  end
end
