# frozen_string_literal: true

module SquareApiClient
# Defines valid values for the `field` sort setting in a
#  [SearchScheduledShifts](api-endpoint:Labor-SearchScheduledShifts) request.
  class ScheduledShiftSortField

    START_AT = "START_AT"
    END_AT = "END_AT"
    CREATED_AT = "CREATED_AT"
    UPDATED_AT = "UPDATED_AT"

  end
end