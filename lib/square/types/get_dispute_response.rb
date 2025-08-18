# frozen_string_literal: true

module Square
  module Types
    # Defines fields in a `RetrieveDispute` response.
    class GetDisputeResponse < Internal::Types::Model
      field :errors, Internal::Types::Array[Square::Types::Error], optional: true, nullable: false
      field :dispute, Square::Types::Dispute, optional: true, nullable: false

    end
  end
end
