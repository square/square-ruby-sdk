# frozen_string_literal: true

module Square
  module Types
    # Additional details about a Buy Now Pay Later payment type.
    class BuyNowPayLaterDetails < Internal::Types::Model
      field :brand, -> { String }, optional: true, nullable: false
      field :afterpay_details, -> { Square::Types::AfterpayDetails }, optional: true, nullable: false
      field :clearpay_details, -> { Square::Types::ClearpayDetails }, optional: true, nullable: false
    end
  end
end
