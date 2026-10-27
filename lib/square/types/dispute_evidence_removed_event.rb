# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    # Published when evidence is removed from a [Dispute](entity:Dispute)
    # from the Disputes Dashboard in the Seller Dashboard, the Square Point of Sale app,
    # or by calling [DeleteDisputeEvidence](api-endpoint:Disputes-DeleteDisputeEvidence).
    class DisputeEvidenceRemovedEvent < Internal::Types::Model
      field :merchant_id, -> { String }, optional: true, nullable: true

      field :location_id, -> { String }, optional: true, nullable: true

      field :type, -> { String }, optional: true, nullable: true

      field :event_id, -> { String }, optional: true, nullable: true

      field :created_at, -> { String }, optional: true, nullable: false

      field :data, -> { Square::Types::DisputeEvidenceRemovedEventData }, optional: true, nullable: false
    end
  end
end
