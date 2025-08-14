# frozen_string_literal: true

module Square
  module Types
    # Defines the fields in a `ListDisputeEvidence` response.
    class ListDisputeEvidenceResponse < Internal::Types::Model
      field :evidence, Internal::Types::Array[Square::DisputeEvidence], optional: true, nullable: false
      field :errors, Internal::Types::Array[Square::Error], optional: true, nullable: false
      field :cursor, String, optional: true, nullable: false

    end
  end
end
