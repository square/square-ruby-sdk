# frozen_string_literal: true

module Square
  module Types
    class LoadResultAnnotation < Internal::Types::Model
      field :measures, -> { Internal::Types::Hash[String, Object] }, optional: false, nullable: false
      field :dimensions, -> { Internal::Types::Hash[String, Object] }, optional: false, nullable: false
      field :segments, -> { Internal::Types::Hash[String, Object] }, optional: false, nullable: false
      field :time_dimensions, -> { Internal::Types::Hash[String, Object] }, optional: false, nullable: false, api_name: "timeDimensions"
    end
  end
end
