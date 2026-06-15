# frozen_string_literal: true

module Square
  module Types
    class QueryFilterCondition < Internal::Types::Model
      field :member, -> { String }, optional: true, nullable: false
      field :operator, -> { String }, optional: true, nullable: false
      field :values, -> { Internal::Types::Array[String] }, optional: true, nullable: false
    end
  end
end
