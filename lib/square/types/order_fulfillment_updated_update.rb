# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    # Information about fulfillment updates.
    class OrderFulfillmentUpdatedUpdate < Internal::Types::Model
      field :fulfillment_uid, -> { String }, optional: true, nullable: true

      field :old_state, -> { Square::Types::FulfillmentState }, optional: true, nullable: false

      field :new_state, -> { Square::Types::FulfillmentState }, optional: true, nullable: false
    end
  end
end
