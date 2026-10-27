# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    module PaymentOptionsDelayAction
      extend Square::Internal::Types::Enum

      CANCEL = "CANCEL"
      COMPLETE = "COMPLETE"
    end
  end
end
