# frozen_string_literal: true

module Square
  # Defines the fields in a `DeleteDisputeEvidence` response.
  class DeleteDisputeEvidenceResponse < Internal::Types::Model
    field :errors, Internal::Types::Array[Square::Error], optional: true, nullable: false

  end
end
