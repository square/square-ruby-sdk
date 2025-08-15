# frozen_string_literal: true

module Square
  # The hours of operation for a location.
  class BusinessHours < Internal::Types::Model
    field :periods, Internal::Types::Array[Square::BusinessHoursPeriod], optional: true, nullable: false

  end
end
