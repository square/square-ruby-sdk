# frozen_string_literal: true

module Square
  module Types
    # Information about the destination against which the payout was made.
    class Destination < Internal::Types::Model
      field :type, Square::Types::DestinationType, optional: true, nullable: false
      field :id, String, optional: true, nullable: false

    end
  end
end
