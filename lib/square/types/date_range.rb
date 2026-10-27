# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    # A range defined by two dates. Used for filtering a query for Connect v2
    # objects that have date properties.
    class DateRange < Internal::Types::Model
      field :start_date, -> { String }, optional: true, nullable: true

      field :end_date, -> { String }, optional: true, nullable: true
    end
  end
end
