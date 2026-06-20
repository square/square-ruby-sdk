# frozen_string_literal: true

module Square
  module Types
    class MetadataResponse < Internal::Types::Model
      field :cubes, -> { Internal::Types::Array[Square::Types::Cube] }, optional: true, nullable: false
      field :compiler_id, -> { String }, optional: true, nullable: false, api_name: "compilerId"
    end
  end
end
