# frozen_string_literal: true

module Square
  class SignatureImage < Internal::Types::Model
    field :image_type, String, optional: true, nullable: false
    field :data, String, optional: true, nullable: false

  end
end
