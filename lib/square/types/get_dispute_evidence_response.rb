# frozen_string_literal: true

module Square
  module Types
    # Defines the fields in a `RetrieveDisputeEvidence` response.
    class GetDisputeEvidenceResponse < Internal::Types::Model
      field :errors, -> { Internal::Types::Array[Square::Types::Error] }, optional: true, nullable: false
      field :evidence, -> { Square::Types::DisputeEvidence }, optional: true, nullable: false
    end
  end
end
