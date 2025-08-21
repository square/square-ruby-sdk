# frozen_string_literal: true

module Square
  module Types
    class DisputeEvidenceRemovedEventObject < Internal::Types::Model
      field :object, -> { Square::Types::Dispute }, optional: true, nullable: false
    end
  end
end
