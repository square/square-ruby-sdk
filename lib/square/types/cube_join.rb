# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    class CubeJoin < Internal::Types::Model
      field :name, -> { String }, optional: false, nullable: false

      field :relationship, -> { String }, optional: false, nullable: false
    end
  end
end
