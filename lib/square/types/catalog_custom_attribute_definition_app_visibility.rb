# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    module CatalogCustomAttributeDefinitionAppVisibility
      extend Square::Internal::Types::Enum

      APP_VISIBILITY_HIDDEN = "APP_VISIBILITY_HIDDEN"
      APP_VISIBILITY_READ_ONLY = "APP_VISIBILITY_READ_ONLY"
      APP_VISIBILITY_READ_WRITE_VALUES = "APP_VISIBILITY_READ_WRITE_VALUES"
    end
  end
end
