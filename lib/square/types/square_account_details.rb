# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    # Additional details about Square Account payments.
    class SquareAccountDetails < Internal::Types::Model
      field :payment_source_token, -> { String }, optional: true, nullable: true

      field :errors, -> { Internal::Types::Array[Square::Types::Error] }, optional: true, nullable: true
    end
  end
end
