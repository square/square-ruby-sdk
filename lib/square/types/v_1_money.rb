# frozen_string_literal: true

module Square
    module Types
        class V1Money < Internal::Types::Model
            field :amount, Integer, optional: true, nullable: false
            field :currency_code, Square::Currency, optional: true, nullable: false
        end
    end
end
