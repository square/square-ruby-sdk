# frozen_string_literal: true

module Square
  module Types
    # Defines the fields that are included in the response body of
    # a request to the [CloneOrder](api-endpoint:Orders-CloneOrder) endpoint.
    class CloneOrderResponse < Internal::Types::Model
      field :order, -> { Square::Types::Order }, optional: true, nullable: false
      field :errors, -> { Internal::Types::Array[Square::Types::Error] }, optional: true, nullable: false

    end
  end
end
