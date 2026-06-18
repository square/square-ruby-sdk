# frozen_string_literal: true

module Square
  module Types
    class Query < Internal::Types::Model
      field :measures, -> { Internal::Types::Array[String] }, optional: true, nullable: false
      field :dimensions, -> { Internal::Types::Array[String] }, optional: true, nullable: false
      field :segments, -> { Internal::Types::Array[String] }, optional: true, nullable: false
      field :time_dimensions, -> { Internal::Types::Array[Square::Types::TimeDimension] }, optional: true, nullable: false, api_name: "timeDimensions"
      field :order, -> { Internal::Types::Array[Internal::Types::Array[String]] }, optional: true, nullable: false
      field :limit, -> { Integer }, optional: true, nullable: false
      field :offset, -> { Integer }, optional: true, nullable: false
      field :filters, -> { Internal::Types::Array[Square::Types::QueryFilter] }, optional: true, nullable: false
      field :ungrouped, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :subquery_joins, -> { Internal::Types::Array[Square::Types::JoinSubquery] }, optional: true, nullable: false, api_name: "subqueryJoins"
      field :join_hints, -> { Internal::Types::Array[Internal::Types::Array[String]] }, optional: true, nullable: false, api_name: "joinHints"
      field :timezone, -> { String }, optional: true, nullable: false
    end
  end
end
