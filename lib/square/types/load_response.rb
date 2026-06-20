# frozen_string_literal: true

module Square
  module Types
    class LoadResponse < Internal::Types::Model
      field :data_source, -> { String }, optional: true, nullable: false, api_name: "dataSource"
      field :annotation, -> { Square::Types::LoadResultAnnotation }, optional: true, nullable: false
      field :data, -> { Square::Types::LoadResultData }, optional: true, nullable: false
      field :last_refresh_time, -> { String }, optional: true, nullable: false, api_name: "lastRefreshTime"
      field :query, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: false
      field :slow_query, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "slowQuery"
      field :external, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :db_type, -> { String }, optional: true, nullable: false, api_name: "dbType"
      field :refresh_key_values, -> { Internal::Types::Array[Internal::Types::Hash[String, Object]] }, optional: true, nullable: false, api_name: "refreshKeyValues"
      field :pivot_query, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: false, api_name: "pivotQuery"
      field :query_type, -> { String }, optional: true, nullable: false, api_name: "queryType"
    end
  end
end
