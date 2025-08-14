# frozen_string_literal: true

module Square
    module Types
        class DisputeEvidenceDeletedEventObject < Square::Internal::Types::Model
            field :object, Square::Dispute, optional: true, nullable: false
        end
    end
end
