# frozen_string_literal: true

module Square
  module Types
    class LaborShiftCreatedEventObject < Internal::Types::Model
      field :shift, Square::Types::Shift, optional: true, nullable: false

    end
  end
end
