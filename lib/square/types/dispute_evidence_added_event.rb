# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    # Published when evidence is added to a [Dispute](entity:Dispute)
    # from the Disputes Dashboard in the Seller Dashboard, the Square Point of Sale app,
    # or by calling either [CreateDisputeEvidenceFile](api-endpoint:Disputes-CreateDisputeEvidenceFile) or
    # [CreateDisputeEvidenceText](api-endpoint:Disputes-CreateDisputeEvidenceText).
    class DisputeEvidenceAddedEvent < Internal::Types::Model
      field :merchant_id, -> { String }, optional: true, nullable: true

      field :location_id, -> { String }, optional: true, nullable: true

      field :type, -> { String }, optional: true, nullable: true

      field :event_id, -> { String }, optional: true, nullable: true

      field :created_at, -> { String }, optional: true, nullable: false

      field :data, -> { Square::Types::DisputeEvidenceAddedEventData }, optional: true, nullable: false
    end
  end
end
