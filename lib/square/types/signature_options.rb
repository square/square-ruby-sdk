# frozen_string_literal: true

module Square
  class SignatureOptions < Internal::Types::Model
    field :title, String, optional: false, nullable: false
    field :body, String, optional: false, nullable: false
    field :signature, Internal::Types::Array[Square::SignatureImage], optional: true, nullable: false

  end
end
