# frozen_string_literal: true

module Square
    module Types
        # Information about the change that triggered the event.
        class CustomerDeletedEventEventContext < Square::Internal::Types::Model
            field :merge, Square::CustomerDeletedEventEventContextMerge, optional: true, nullable: false
        end
    end
end
