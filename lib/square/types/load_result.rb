# frozen_string_literal: true

module Square
  module Types
    class LoadResult < Internal::Types::Model
      field :data_source, -> { String }, optional: true, nullable: false, api_name: "dataSource"
      field :annotation, -> { Square::Types::LoadResultAnnotation }, optional: false, nullable: false
      field :data, -> { Square::Types::LoadResultData }, optional: false, nullable: false
      field :refresh_key_values, -> { Internal::Types::Array[Internal::Types::Hash[String, Object]] }, optional: true, nullable: false, api_name: "refreshKeyValues"
      field :last_refresh_time, -> { String }, optional: true, nullable: false, api_name: "lastRefreshTime"
    end
  end
end
