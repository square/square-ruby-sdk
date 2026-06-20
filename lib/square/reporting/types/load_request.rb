# frozen_string_literal: true

module Square
  module Reporting
    module Types
      class LoadRequest < Internal::Types::Model
        field :query_type, -> { String }, optional: true, nullable: false, api_name: "queryType"
        field :cache, -> { Square::Types::CacheMode }, optional: true, nullable: false
        field :query, -> { Square::Types::Query }, optional: true, nullable: false
      end
    end
  end
end
