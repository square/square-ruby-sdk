# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    # Represents the origination details of an order.
    class OrderSource < Internal::Types::Model
      field :name, -> { String }, optional: true, nullable: true
    end
  end
end
