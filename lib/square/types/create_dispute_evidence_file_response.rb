# frozen_string_literal: true

module Square
  # Defines the fields in a `CreateDisputeEvidenceFile` response.
  class CreateDisputeEvidenceFileResponse < Internal::Types::Model
    field :errors, Internal::Types::Array[Square::Error], optional: true, nullable: false
    field :evidence, Square::DisputeEvidence, optional: true, nullable: false

  end
end
