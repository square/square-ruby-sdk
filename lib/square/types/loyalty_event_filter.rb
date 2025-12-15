# frozen_string_literal: true

module Square
  module Types
    # The filtering criteria. If the request specifies multiple filters,
    # the endpoint uses a logical AND to evaluate them.
    class LoyaltyEventFilter < Internal::Types::Model
      field :loyalty_account_filter, -> { Square::Types::LoyaltyEventLoyaltyAccountFilter }, optional: true, nullable: false
      field :type_filter, -> { Square::Types::LoyaltyEventTypeFilter }, optional: true, nullable: false
      field :date_time_filter, -> { Square::Types::LoyaltyEventDateTimeFilter }, optional: true, nullable: false
      field :location_filter, -> { Square::Types::LoyaltyEventLocationFilter }, optional: true, nullable: false
      field :order_filter, -> { Square::Types::LoyaltyEventOrderFilter }, optional: true, nullable: false
    end
  end
end
