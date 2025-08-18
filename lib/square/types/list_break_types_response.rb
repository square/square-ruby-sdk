# frozen_string_literal: true

module Square
  module Types
    # The response to a request for a set of `BreakType` objects. The response contains
    # the requested `BreakType` objects and might contain a set of `Error` objects if
    # the request resulted in errors.
    class ListBreakTypesResponse < Internal::Types::Model
      field :break_types, -> { Internal::Types::Array[Square::Types::BreakType] }, optional: true, nullable: false
      field :cursor, -> { String }, optional: true, nullable: false
      field :errors, -> { Internal::Types::Array[Square::Types::Error] }, optional: true, nullable: false

    end
  end
end
