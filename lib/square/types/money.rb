# frozen_string_literal: true

module Square
  module Types
    # Represents an amount of money. `Money` fields can be signed or unsigned.
    # Fields that do not explicitly define whether they are signed or unsigned are
    # considered unsigned and can only hold positive amounts. For signed fields, the
    # sign of the value indicates the purpose of the money transfer. See
    # [Working with Monetary Amounts](https://developer.squareup.com/docs/build-basics/working-with-monetary-amounts)
    # for more information.
    class Money < Internal::Types::Model
      field :amount, -> { Integer }, optional: true, nullable: false
      field :currency, -> { Square::Types::Currency }, optional: true, nullable: false

    end
  end
end
