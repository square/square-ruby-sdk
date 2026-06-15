# frozen_string_literal: true

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
