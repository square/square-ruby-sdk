# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    class LaborScheduledShiftCreatedEventData < Internal::Types::Model
      field :type, -> { String }, optional: true, nullable: true

      field :id, -> { String }, optional: true, nullable: false

      field :object, -> { Square::Types::LaborScheduledShiftCreatedEventObject }, optional: true, nullable: false
    end
  end
end
