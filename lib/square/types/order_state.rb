# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    module OrderState
      extend Square::Internal::Types::Enum

      OPEN = "OPEN"
      COMPLETED = "COMPLETED"
      CANCELED = "CANCELED"
      DRAFT = "DRAFT"
    end
  end
end
