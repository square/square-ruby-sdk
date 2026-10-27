# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    class QueryFilterOr < Internal::Types::Model
      field :or_, -> { Internal::Types::Array[Internal::Types::Hash[String, Object]] }, optional: false, nullable: false, api_name: "or"
    end
  end
end
