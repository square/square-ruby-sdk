# frozen_string_literal: true

module Square
  module Types
    # The response to a request to create a `Timecard`. The response contains
    # the created `Timecard` object and might contain a set of `Error` objects if
    # the request resulted in errors.
    class CreateTimecardResponse < Internal::Types::Model
      field :timecard, Square::Timecard, optional: true, nullable: false
      field :errors, Internal::Types::Array[Square::Error], optional: true, nullable: false

    end
  end
end
