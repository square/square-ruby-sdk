# frozen_string_literal: true

module Square
  module Types
    class Folder < Internal::Types::Model
      field :name, -> { String }, optional: false, nullable: false
      field :members, -> { Internal::Types::Array[String] }, optional: false, nullable: false
    end
  end
end
