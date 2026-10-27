# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    # Filter events by the order associated with the event.
    class LoyaltyEventOrderFilter < Internal::Types::Model
      field :order_id, -> { String }, optional: false, nullable: false
    end
  end
end
