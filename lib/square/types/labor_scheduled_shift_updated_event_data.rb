# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    class LaborScheduledShiftUpdatedEventData < Internal::Types::Model
      field :type, -> { String }, optional: true, nullable: true

      field :id, -> { String }, optional: true, nullable: false

      field :object, -> { Square::Types::LaborScheduledShiftUpdatedEventObject }, optional: true, nullable: false
    end
  end
end
