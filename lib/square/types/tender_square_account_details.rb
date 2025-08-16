# frozen_string_literal: true

module Square
  module Types
    # Represents the details of a tender with `type` `SQUARE_ACCOUNT`.
    class TenderSquareAccountDetails < Internal::Types::Model
      field :status, Square::TenderSquareAccountDetailsStatus, optional: true, nullable: false

    end
  end
end
