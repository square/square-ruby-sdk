# frozen_string_literal: true

module Square
  module Types
    # A response that contains a list of `GiftCardActivity` objects. If the request resulted in errors,
    # the response contains a set of `Error` objects.
    class ListGiftCardActivitiesResponse < Internal::Types::Model
      field :errors, -> { Internal::Types::Array[Square::Types::Error] }, optional: true, nullable: false
      field :gift_card_activities, lambda {
        Internal::Types::Array[Square::Types::GiftCardActivity]
      }, optional: true, nullable: false
      field :cursor, -> { String }, optional: true, nullable: false
    end
  end
end
