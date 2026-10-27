# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    class ShippingFee < Internal::Types::Model
      field :name, -> { String }, optional: true, nullable: true

      field :charge, -> { Square::Types::Money }, optional: false, nullable: false
    end
  end
end
