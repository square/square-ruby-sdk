
module Square
  module Disputes
    module Types
      class CreateDisputeEvidenceTextRequest < Internal::Types::Model
        field :dispute_id, -> { String }, optional: false, nullable: false
        field :idempotency_key, -> { String }, optional: false, nullable: false
        field :evidence_type, -> { Square::Types::DisputeEvidenceType }, optional: true, nullable: false
        field :evidence_text, -> { String }, optional: false, nullable: false

      end
    end
  end
end
