# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    # A rounding adjustment of the money being returned. Commonly used to apply cash rounding
    # when the minimum unit of the account is smaller than the lowest physical denomination of the currency.
    class OrderRoundingAdjustment < Internal::Types::Model
      field :uid, -> { String }, optional: true, nullable: true

      field :name, -> { String }, optional: true, nullable: true

      field :amount_money, -> { Square::Types::Money }, optional: true, nullable: false
    end
  end
end
