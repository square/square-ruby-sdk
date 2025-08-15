# frozen_string_literal: true

module Square
  # The response object returned by the [CreateLocation](api-endpoint:Locations-CreateLocation) endpoint.
  class CreateLocationResponse < Internal::Types::Model
    field :errors, Internal::Types::Array[Square::Error], optional: true, nullable: false
    field :location, Square::Location, optional: true, nullable: false

  end
end
