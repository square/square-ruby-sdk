# frozen_string_literal: true

module Square
  module Types
    # Represents a Square gift card.
    class GiftCard < Internal::Types::Model
      field :id, -> { String }, optional: true, nullable: false
      field :type, -> { Square::Types::GiftCardType }, optional: false, nullable: false
      field :gan_source, -> { Square::Types::GiftCardGanSource }, optional: true, nullable: false
      field :state, -> { Square::Types::GiftCardStatus }, optional: true, nullable: false
      field :balance_money, -> { Square::Types::Money }, optional: true, nullable: false
      field :gan, -> { String }, optional: true, nullable: false
      field :created_at, -> { String }, optional: true, nullable: false
      field :customer_ids, -> { Internal::Types::Array[String] }, optional: true, nullable: false

    end
  end
end
