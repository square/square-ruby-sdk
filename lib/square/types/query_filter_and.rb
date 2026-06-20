# frozen_string_literal: true

module Square
  module Types
    class QueryFilterAnd < Internal::Types::Model
      field :and_, -> { Internal::Types::Array[Internal::Types::Hash[String, Object]] }, optional: false, nullable: false, api_name: "and"
    end
  end
end
