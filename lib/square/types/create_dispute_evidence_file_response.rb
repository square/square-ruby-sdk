# frozen_string_literal: true

module Square
    module Types
        # Defines the fields in a `CreateDisputeEvidenceFile` response.
        class CreateDisputeEvidenceFileResponse < Square::Internal::Types::Model
            field :errors, Square::Internal::Types::Array[Square::Types::Error], optional: true, nullable: false
            field :evidence, Square::DisputeEvidence, optional: true, nullable: false
        end
    end
end
