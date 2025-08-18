# frozen_string_literal: true

module Square
  module Types
    # Defines the fields that are included in the response body of
    # a request to the [DisableEvents](api-endpoint:Events-DisableEvents) endpoint.
    # 
    # Note: if there are errors processing the request, the events field will not be
    # present.
    class DisableEventsResponse < Internal::Types::Model
      field :errors, Internal::Types::Array[Square::Types::Error], optional: true, nullable: false

    end
  end
end
