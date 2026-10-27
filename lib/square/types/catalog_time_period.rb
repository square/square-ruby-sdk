# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    # Represents a time period - either a single period or a repeating period.
    class CatalogTimePeriod < Internal::Types::Model
      field :event, -> { String }, optional: true, nullable: true
    end
  end
end
