# frozen_string_literal: true

module Square
    module Types
        class DisputeEvidenceCreatedEventData < Internal::Types::Model
            field :type, String, optional: true, nullable: false
            field :id, String, optional: true, nullable: false
            field :object, Square::DisputeEvidenceCreatedEventObject, optional: true, nullable: false
        end
    end
end
