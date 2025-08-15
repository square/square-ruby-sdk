# frozen_string_literal: true

module Square
  # Represents the origination details of an order.
  class OrderSource < Internal::Types::Model
    field :name, String, optional: true, nullable: false

  end
end
