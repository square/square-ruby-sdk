# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    class DisputeEvidence < Internal::Types::Model
      field :evidence_id, -> { String }, optional: true, nullable: true

      field :id, -> { String }, optional: true, nullable: false

      field :dispute_id, -> { String }, optional: true, nullable: true

      field :evidence_file, -> { Square::Types::DisputeEvidenceFile }, optional: true, nullable: false

      field :evidence_text, -> { String }, optional: true, nullable: true

      field :uploaded_at, -> { String }, optional: true, nullable: true

      field :evidence_type, -> { Square::Types::DisputeEvidenceType }, optional: true, nullable: false
    end
  end
end
