# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    module PayoutFeeType
      extend Square::Internal::Types::Enum

      TRANSFER_FEE = "TRANSFER_FEE"
      TAX_ON_TRANSFER_FEE = "TAX_ON_TRANSFER_FEE"
    end
  end
end
