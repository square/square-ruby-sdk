# frozen_string_literal: true

module Square
    module Types
        # Published when evidence is added to a [Dispute](entity:Dispute)
        # from the Disputes Dashboard in the Seller Dashboard, the Square Point of Sale app,
        # or by calling either [CreateDisputeEvidenceFile](api-endpoint:Disputes-CreateDisputeEvidenceFile) or [CreateDisputeEvidenceText](api-endpoint:Disputes-CreateDisputeEvidenceText).
        class DisputeEvidenceCreatedEvent < Square::Internal::Types::Model
            field :merchant_id, String, optional: true, nullable: false
            field :location_id, String, optional: true, nullable: false
            field :type, String, optional: true, nullable: false
            field :event_id, String, optional: true, nullable: false
            field :created_at, String, optional: true, nullable: false
            field :data, Square::DisputeEvidenceCreatedEventData, optional: true, nullable: false
        end
    end
end
