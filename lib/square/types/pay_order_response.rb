# frozen_string_literal: true

module Square
  module Types
    # Defines the fields that are included in the response body of a request to the
    # [PayOrder](api-endpoint:Orders-PayOrder) endpoint.
    class PayOrderResponse < Internal::Types::Model
      field :errors, -> { Internal::Types::Array[Square::Types::Error] }, optional: true, nullable: false
      field :order, -> { Square::Types::Order }, optional: true, nullable: false

    end
  end
end
