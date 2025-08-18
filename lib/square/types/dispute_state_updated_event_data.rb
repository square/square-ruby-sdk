# frozen_string_literal: true

module Square
  module Types
    class DisputeStateUpdatedEventData < Internal::Types::Model
      field :type, -> { String }, optional: true, nullable: false
      field :id, -> { String }, optional: true, nullable: false
      field :object, -> { Square::Types::DisputeStateUpdatedEventObject }, optional: true, nullable: false

    end
  end
end
