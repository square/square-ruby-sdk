# frozen_string_literal: true

module Square
  module Types
    # Information about the change that triggered the event.
    class CustomerCreatedEventEventContext < Internal::Types::Model
      field :merge, Square::CustomerCreatedEventEventContextMerge, optional: true, nullable: false

    end
  end
end
