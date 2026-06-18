# frozen_string_literal: true

module Square
  module Types
    class DimensionGranularity < Internal::Types::Model
      field :name, -> { String }, optional: false, nullable: false
      field :title, -> { String }, optional: false, nullable: false
      field :interval, -> { String }, optional: true, nullable: false
      field :sql, -> { String }, optional: true, nullable: false
      field :offset, -> { String }, optional: true, nullable: false
      field :origin, -> { String }, optional: true, nullable: false
    end
  end
end
