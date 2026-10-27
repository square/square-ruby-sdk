# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    class LaborTimecardCreatedEventObject < Internal::Types::Model
      field :timecard, -> { Square::Types::Timecard }, optional: true, nullable: false
    end
  end
end
