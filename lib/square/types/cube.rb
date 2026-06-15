# frozen_string_literal: true

module Square
  module Types
    class Cube < Internal::Types::Model
      field :name, -> { String }, optional: false, nullable: false
      field :title, -> { String }, optional: true, nullable: false
      field :type, -> { Square::Types::CubeType }, optional: false, nullable: false
      field :meta, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: false
      field :description, -> { String }, optional: true, nullable: false
      field :measures, -> { Internal::Types::Array[Square::Types::Measure] }, optional: false, nullable: false
      field :dimensions, -> { Internal::Types::Array[Square::Types::Dimension] }, optional: false, nullable: false
      field :segments, -> { Internal::Types::Array[Square::Types::Segment] }, optional: false, nullable: false
      field :joins, -> { Internal::Types::Array[Square::Types::CubeJoin] }, optional: true, nullable: false
      field :folders, -> { Internal::Types::Array[Square::Types::Folder] }, optional: true, nullable: false
      field :nested_folders, -> { Internal::Types::Array[Square::Types::NestedFolder] }, optional: true, nullable: false, api_name: "nestedFolders"
      field :hierarchies, -> { Internal::Types::Array[Square::Types::Hierarchy] }, optional: true, nullable: false
    end
  end
end
