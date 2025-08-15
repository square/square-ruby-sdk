# frozen_string_literal: true

module Square
  class ShippingFee < Internal::Types::Model
    field :name, String, optional: true, nullable: false
    field :charge, Square::Money, optional: false, nullable: false

  end
end
