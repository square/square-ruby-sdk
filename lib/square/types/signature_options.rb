# frozen_string_literal: true

module Square
  module Types
    class SignatureOptions < Internal::Types::Model
      field :title, -> { String }, optional: false, nullable: false
      field :body, -> { String }, optional: false, nullable: false
      field :signature, -> { Internal::Types::Array[Square::Types::SignatureImage] }, optional: true, nullable: false
    end
  end
end
