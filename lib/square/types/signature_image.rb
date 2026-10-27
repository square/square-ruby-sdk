# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    class SignatureImage < Internal::Types::Model
      field :image_type, -> { String }, optional: true, nullable: false

      field :data, -> { String }, optional: true, nullable: false
    end
  end
end
