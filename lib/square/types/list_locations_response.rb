# frozen_string_literal: true

module Square
  # Defines the fields that are included in the response body of a request
  # to the [ListLocations](api-endpoint:Locations-ListLocations) endpoint.
  # 
  # Either `errors` or `locations` is present in a given response (never both).
  class ListLocationsResponse < Internal::Types::Model
    field :errors, Internal::Types::Array[Square::Error], optional: true, nullable: false
    field :locations, Internal::Types::Array[Square::Location], optional: true, nullable: false

  end
end
