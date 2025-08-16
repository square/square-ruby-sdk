# frozen_string_literal: true

module Square
  module Types
    # The data associated with a `loyalty.program.created` event.
    class LoyaltyProgramCreatedEventData < Internal::Types::Model
      field :type, String, optional: true, nullable: false
      field :id, String, optional: true, nullable: false
      field :object, Square::LoyaltyProgramCreatedEventObject, optional: true, nullable: false

    end
  end
end
