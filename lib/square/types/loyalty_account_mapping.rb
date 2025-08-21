# frozen_string_literal: true

module Square
  module Types
    # Represents the mapping that associates a loyalty account with a buyer.
    #
    # Currently, a loyalty account can only be mapped to a buyer by phone number. For more information, see
    # [Loyalty Overview](https://developer.squareup.com/docs/loyalty/overview).
    class LoyaltyAccountMapping < Internal::Types::Model
      field :id, -> { String }, optional: true, nullable: false
      field :created_at, -> { String }, optional: true, nullable: false
      field :phone_number, -> { String }, optional: true, nullable: false
    end
  end
end
