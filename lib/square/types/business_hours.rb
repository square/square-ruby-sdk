# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    # The hours of operation for a location.
    class BusinessHours < Internal::Types::Model
      field :periods, -> { Internal::Types::Array[Square::Types::BusinessHoursPeriod] }, optional: true, nullable: true
    end
  end
end
