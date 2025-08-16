# frozen_string_literal: true

module Square
  module Types
    # The response to a request for a set of `WorkweekConfig` objects. The response contains
    # the requested `WorkweekConfig` objects and might contain a set of `Error` objects if
    # the request resulted in errors.
    class ListWorkweekConfigsResponse < Internal::Types::Model
      field :workweek_configs, Internal::Types::Array[Square::WorkweekConfig], optional: true, nullable: false
      field :cursor, String, optional: true, nullable: false
      field :errors, Internal::Types::Array[Square::Error], optional: true, nullable: false

    end
  end
end
