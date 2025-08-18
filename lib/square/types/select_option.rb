# frozen_string_literal: true

module Square
  module Types
    class SelectOption < Internal::Types::Model
      field :reference_id, -> { String }, optional: false, nullable: false
      field :title, -> { String }, optional: false, nullable: false

    end
  end
end
