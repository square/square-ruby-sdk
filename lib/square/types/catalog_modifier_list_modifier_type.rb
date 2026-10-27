# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    module CatalogModifierListModifierType
      extend Square::Internal::Types::Enum

      LIST = "LIST"
      TEXT = "TEXT"
    end
  end
end
