# frozen_string_literal: true

module Square
  module Types
    # Defines the parameters for a `CreateDisputeEvidenceFile` request.
    class CreateDisputeEvidenceFileRequest < Internal::Types::Model
      field :idempotency_key, -> { String }, optional: false, nullable: false
      field :evidence_type, -> { Square::Types::DisputeEvidenceType }, optional: true, nullable: false
      field :content_type, -> { String }, optional: true, nullable: false
    end
  end
end
