# frozen_string_literal: true

module Square
    module Types
        # A range defined by two dates. Used for filtering a query for Connect v2
        # objects that have date properties.
        class DateRange < Square::Internal::Types::Model
            field :start_date, String, optional: true, nullable: false
            field :end_date, String, optional: true, nullable: false
        end
    end
end
