# frozen_string_literal: true

module Square
  # Defines fields in a `RetrieveDispute` response.
  class GetDisputeResponse < Internal::Types::Model
    field :errors, Internal::Types::Array[Square::Error], optional: true, nullable: false
    field :dispute, Square::Dispute, optional: true, nullable: false

  end
end
