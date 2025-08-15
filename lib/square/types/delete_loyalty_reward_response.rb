# frozen_string_literal: true

module Square
  # A response returned by the API call.
  class DeleteLoyaltyRewardResponse < Internal::Types::Model
    field :errors, Internal::Types::Array[Square::Error], optional: true, nullable: false

  end
end
