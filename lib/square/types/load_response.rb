# frozen_string_literal: true

module Square
  module Types
    class LoadResponse < Internal::Types::Model
      field :pivot_query, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: false, api_name: "pivotQuery"
      field :slow_query, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "slowQuery"
      field :query_type, -> { String }, optional: true, nullable: false, api_name: "queryType"
      field :results, -> { Internal::Types::Array[Square::Types::LoadResult] }, optional: false, nullable: false
    end
  end
end
