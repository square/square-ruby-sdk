# frozen_string_literal: true

module Square
  module Types
    # Defines output parameters in a response from the
    # [SearchSubscriptions](api-endpoint:Subscriptions-SearchSubscriptions) endpoint.
    class SearchSubscriptionsResponse < Internal::Types::Model
      field :errors, Internal::Types::Array[Square::Error], optional: true, nullable: false
      field :subscriptions, Internal::Types::Array[Square::Subscription], optional: true, nullable: false
      field :cursor, String, optional: true, nullable: false

    end
  end
end
