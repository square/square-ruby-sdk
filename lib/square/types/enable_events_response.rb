# frozen_string_literal: true

module Square
  module Types
    # Defines the fields that are included in the response body of
    # a request to the [EnableEvents](api-endpoint:Events-EnableEvents) endpoint.
    #
    # Note: if there are errors processing the request, the events field will not be
    # present.
    class EnableEventsResponse < Internal::Types::Model
      field :errors, -> { Internal::Types::Array[Square::Types::Error] }, optional: true, nullable: false
    end
  end
end
