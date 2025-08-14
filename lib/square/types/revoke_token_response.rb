# frozen_string_literal: true

module Square
    module Types
        class RevokeTokenResponse < Square::Internal::Types::Model
            field :success, Square::Internal::Types::Boolean, optional: true, nullable: false
            field :errors, Square::Internal::Types::Array[Square::Error], optional: true, nullable: false
        end
    end
end
