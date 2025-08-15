# frozen_string_literal: true

module Square
  class LaborShiftCreatedEventObject < Internal::Types::Model
    field :shift, Square::Shift, optional: true, nullable: false

  end
end
