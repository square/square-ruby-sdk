# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    module SimpleFormat
      extend Square::Internal::Types::Enum

      PERCENT = "percent"
      CURRENCY = "currency"
      NUMBER = "number"
      IMAGE_URL = "imageUrl"
      ID = "id"
      LINK = "link"
    end
  end
end
