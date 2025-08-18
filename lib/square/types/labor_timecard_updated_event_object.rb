# frozen_string_literal: true

module Square
  module Types
    class LaborTimecardUpdatedEventObject < Internal::Types::Model
      field :timecard, -> { Square::Types::Timecard }, optional: true, nullable: false

    end
  end
end
