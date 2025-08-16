# frozen_string_literal: true

module Square
  module Types
    # The response to a request to update a `WorkweekConfig` object. The response contains
    # the updated `WorkweekConfig` object and might contain a set of `Error` objects if
    # the request resulted in errors.
    class UpdateWorkweekConfigResponse < Internal::Types::Model
      field :workweek_config, Square::WorkweekConfig, optional: true, nullable: false
      field :errors, Internal::Types::Array[Square::Error], optional: true, nullable: false

    end
  end
end
