# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    # A value qualified by unit of measure.
    class DeviceComponentDetailsMeasurement < Internal::Types::Model
      field :value, -> { Integer }, optional: true, nullable: true
    end
  end
end
