# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    # The origination details of the subscription.
    class SubscriptionSource < Internal::Types::Model
      field :name, -> { String }, optional: true, nullable: true
    end
  end
end
