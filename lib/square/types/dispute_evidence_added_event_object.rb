# frozen_string_literal: true

module Square
  module Types
    class DisputeEvidenceAddedEventObject < Internal::Types::Model
      field :object, Square::Dispute, optional: true, nullable: false

    end
  end
end
