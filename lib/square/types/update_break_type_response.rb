# frozen_string_literal: true

module Square
  module Types
    # A response to a request to update a `BreakType`. The response contains
    # the requested `BreakType` objects and might contain a set of `Error` objects if
    # the request resulted in errors.
    class UpdateBreakTypeResponse < Internal::Types::Model
      field :break_type, -> { Square::Types::BreakType }, optional: true, nullable: false
      field :errors, -> { Internal::Types::Array[Square::Types::Error] }, optional: true, nullable: false

    end
  end
end
