# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    module CheckoutOptionsPhoneCollection
      extend Square::Internal::Types::Enum

      REQUIRED = "REQUIRED"
      OPTIONAL = "OPTIONAL"
      HIDDEN = "HIDDEN"
    end
  end
end
