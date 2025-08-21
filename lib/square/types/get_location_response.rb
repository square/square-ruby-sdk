# frozen_string_literal: true

module Square
  module Types
    # Defines the fields that the [RetrieveLocation](api-endpoint:Locations-RetrieveLocation)
    # endpoint returns in a response.
    class GetLocationResponse < Internal::Types::Model
      field :errors, -> { Internal::Types::Array[Square::Types::Error] }, optional: true, nullable: false
      field :location, -> { Square::Types::Location }, optional: true, nullable: false
    end
  end
end
