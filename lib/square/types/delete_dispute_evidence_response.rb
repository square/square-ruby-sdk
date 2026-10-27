# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    # Defines the fields in a `DeleteDisputeEvidence` response.
    class DeleteDisputeEvidenceResponse < Internal::Types::Model
      field :errors, -> { Internal::Types::Array[Square::Types::Error] }, optional: true, nullable: false
    end
  end
end
