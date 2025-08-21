# frozen_string_literal: true

module Square
  module Types
    # The parameters of a `Shift` search query, which includes filter and sort options.
    #
    # Deprecated at Square API version 2025-05-21. See the [migration notes](https://developer.squareup.com/docs/labor-api/what-it-does#migration-notes).
    class ShiftQuery < Internal::Types::Model
      field :filter, -> { Square::Types::ShiftFilter }, optional: true, nullable: false
      field :sort, -> { Square::Types::ShiftSort }, optional: true, nullable: false
    end
  end
end
