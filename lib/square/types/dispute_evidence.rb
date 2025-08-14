# frozen_string_literal: true

module Square
    module Types
        class DisputeEvidence < Square::Internal::Types::Model
            field :evidence_id, String, optional: true, nullable: false
            field :id, String, optional: true, nullable: false
            field :dispute_id, String, optional: true, nullable: false
            field :evidence_file, Square::DisputeEvidenceFile, optional: true, nullable: false
            field :evidence_text, String, optional: true, nullable: false
            field :uploaded_at, String, optional: true, nullable: false
            field :evidence_type, Square::DisputeEvidenceType, optional: true, nullable: false
        end
    end
end
