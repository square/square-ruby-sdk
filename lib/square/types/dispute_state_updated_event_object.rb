# frozen_string_literal: true

module Square
  class DisputeStateUpdatedEventObject < Internal::Types::Model
    field :object, Square::Dispute, optional: true, nullable: false

  end
end
