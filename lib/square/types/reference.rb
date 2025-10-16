# frozen_string_literal: true

module Square
  module Types
    class Reference < Internal::Types::Model
      field :type, -> { Square::Types::ReferenceType }, optional: true, nullable: false
      field :id, -> { String }, optional: true, nullable: false
    end
  end
end
