# frozen_string_literal: true

module Square
  class LaborTimecardCreatedEventObject < Internal::Types::Model
    field :timecard, Square::Timecard, optional: true, nullable: false

  end
end
