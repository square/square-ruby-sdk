# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    # Provides information about the subscription event.
    class SubscriptionEventInfo < Internal::Types::Model
      field :detail, -> { String }, optional: true, nullable: true

      field :code, -> { Square::Types::SubscriptionEventInfoCode }, optional: true, nullable: false
    end
  end
end
