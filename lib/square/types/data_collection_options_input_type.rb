# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    module DataCollectionOptionsInputType
      extend Square::Internal::Types::Enum

      EMAIL = "EMAIL"
      PHONE_NUMBER = "PHONE_NUMBER"
    end
  end
end
