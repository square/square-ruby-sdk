# frozen_string_literal: true

module Square
  module Types
    class LaborScheduledShiftCreatedEventData < Internal::Types::Model
      field :type, -> { String }, optional: true, nullable: false
      field :id, -> { String }, optional: true, nullable: false
      field :object, -> { Square::Types::LaborScheduledShiftCreatedEventObject }, optional: true, nullable: false
    end
  end
end
