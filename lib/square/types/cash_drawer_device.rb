# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    class CashDrawerDevice < Internal::Types::Model
      field :id, -> { String }, optional: true, nullable: false

      field :name, -> { String }, optional: true, nullable: true
    end
  end
end
