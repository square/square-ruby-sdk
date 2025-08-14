# frozen_string_literal: true

module Square
  module Types
    # The data associated with a `loyalty.program.updated` event.
    class LoyaltyProgramUpdatedEventData < Internal::Types::Model
      field :type, String, optional: true, nullable: false
      field :id, String, optional: true, nullable: false
      field :object, Square::LoyaltyProgramUpdatedEventObject, optional: true, nullable: false

    end
  end
end
