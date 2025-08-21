# frozen_string_literal: true

module Square
  module Types
    class CashDrawerDevice < Internal::Types::Model
      field :id, -> { String }, optional: true, nullable: false
      field :name, -> { String }, optional: true, nullable: false
    end
  end
end
