# frozen_string_literal: true

module Square
  class DisputeStateUpdatedEventData < Internal::Types::Model
    field :type, String, optional: true, nullable: false
    field :id, String, optional: true, nullable: false
    field :object, Square::DisputeStateUpdatedEventObject, optional: true, nullable: false

  end
end
