# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    # Represents the details of a tender with `type` `SQUARE_ACCOUNT`.
    class TenderSquareAccountDetails < Internal::Types::Model
      field :status, -> { Square::Types::TenderSquareAccountDetailsStatus }, optional: true, nullable: false
    end
  end
end
