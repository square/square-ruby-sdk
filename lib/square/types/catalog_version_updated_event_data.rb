# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    class CatalogVersionUpdatedEventData < Internal::Types::Model
      field :type, -> { String }, optional: true, nullable: true

      field :object, -> { Square::Types::CatalogVersionUpdatedEventObject }, optional: true, nullable: false
    end
  end
end
