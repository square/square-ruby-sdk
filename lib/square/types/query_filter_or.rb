# frozen_string_literal: true

module Square
  module Types
    class QueryFilterOr < Internal::Types::Model
      field :or_, -> { Internal::Types::Array[Internal::Types::Hash[String, Object]] }, optional: true, nullable: false, api_name: "or"
    end
  end
end
