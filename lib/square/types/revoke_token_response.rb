# frozen_string_literal: true

module Square
  module Types
    class RevokeTokenResponse < Internal::Types::Model
      field :success, Internal::Types::Boolean, optional: true, nullable: false
      field :errors, Internal::Types::Array[Square::Error], optional: true, nullable: false

    end
  end
end
