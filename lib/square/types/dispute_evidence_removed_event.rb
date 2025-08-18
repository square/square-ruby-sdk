# frozen_string_literal: true

module Square
  module Types
    # Published when evidence is removed from a [Dispute](entity:Dispute)
    # from the Disputes Dashboard in the Seller Dashboard, the Square Point of Sale app,
    # or by calling [DeleteDisputeEvidence](api-endpoint:Disputes-DeleteDisputeEvidence).
    class DisputeEvidenceRemovedEvent < Internal::Types::Model
      field :merchant_id, -> { String }, optional: true, nullable: false
      field :location_id, -> { String }, optional: true, nullable: false
      field :type, -> { String }, optional: true, nullable: false
      field :event_id, -> { String }, optional: true, nullable: false
      field :created_at, -> { String }, optional: true, nullable: false
      field :data, -> { Square::Types::DisputeEvidenceRemovedEventData }, optional: true, nullable: false

    end
  end
end
