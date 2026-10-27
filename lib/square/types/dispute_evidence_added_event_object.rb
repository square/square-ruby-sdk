# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    class DisputeEvidenceAddedEventObject < Internal::Types::Model
      field :object, -> { Square::Types::Dispute }, optional: true, nullable: false
    end
  end
end
