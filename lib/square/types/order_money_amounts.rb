# frozen_string_literal: true

module Square
  module Types
    # A collection of various money amounts.
    class OrderMoneyAmounts < Internal::Types::Model
      field :total_money, -> { Square::Types::Money }, optional: true, nullable: false
      field :tax_money, -> { Square::Types::Money }, optional: true, nullable: false
      field :discount_money, -> { Square::Types::Money }, optional: true, nullable: false
      field :tip_money, -> { Square::Types::Money }, optional: true, nullable: false
      field :service_charge_money, -> { Square::Types::Money }, optional: true, nullable: false

    end
  end
end
