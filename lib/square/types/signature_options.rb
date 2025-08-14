# frozen_string_literal: true

module Square
    module Types
        class SignatureOptions < Square::Internal::Types::Model
            field :title, String, optional: false, nullable: false
            field :body, String, optional: false, nullable: false
            field :signature, Square::Internal::Types::Array[Square::SignatureImage], optional: true, nullable: false
        end
    end
end
