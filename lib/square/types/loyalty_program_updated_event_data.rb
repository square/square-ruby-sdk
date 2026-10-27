# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    # The data associated with a `loyalty.program.updated` event.
    class LoyaltyProgramUpdatedEventData < Internal::Types::Model
      field :type, -> { String }, optional: true, nullable: true

      field :id, -> { String }, optional: true, nullable: false

      field :object, -> { Square::Types::LoyaltyProgramUpdatedEventObject }, optional: true, nullable: false
    end
  end
end
