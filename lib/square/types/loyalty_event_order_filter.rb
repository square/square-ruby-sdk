# frozen_string_literal: true

module Square
  # Filter events by the order associated with the event.
  class LoyaltyEventOrderFilter < Internal::Types::Model
    field :order_id, String, optional: false, nullable: false

  end
end
