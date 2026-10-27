# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    class QueryFilterCondition < Internal::Types::Model
      field :member, -> { String }, optional: false, nullable: false

      field :operator, -> { String }, optional: false, nullable: false

      field :values, -> { Internal::Types::Array[String] }, optional: true, nullable: false
    end
  end
end
