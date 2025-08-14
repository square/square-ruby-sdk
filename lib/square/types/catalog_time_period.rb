# frozen_string_literal: true

module Square
    module Types
        # Represents a time period - either a single period or a repeating period.
        class CatalogTimePeriod < Square::Internal::Types::Model
            field :event, String, optional: true, nullable: false
        end
    end
end
