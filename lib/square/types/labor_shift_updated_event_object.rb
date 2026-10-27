# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    class LaborShiftUpdatedEventObject < Internal::Types::Model
      field :shift, -> { Square::Types::Shift }, optional: true, nullable: false
    end
  end
end
