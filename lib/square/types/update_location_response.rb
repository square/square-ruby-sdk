# frozen_string_literal: true

module Square
  module Types
    # The response object returned by the [UpdateLocation](api-endpoint:Locations-UpdateLocation) endpoint.
    class UpdateLocationResponse < Internal::Types::Model
      field :errors, -> { Internal::Types::Array[Square::Types::Error] }, optional: true, nullable: false
      field :location, -> { Square::Types::Location }, optional: true, nullable: false
    end
  end
end
