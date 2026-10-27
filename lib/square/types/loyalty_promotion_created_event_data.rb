# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    # The data associated with a `loyalty.promotion.created` event.
    class LoyaltyPromotionCreatedEventData < Internal::Types::Model
      field :type, -> { String }, optional: true, nullable: true

      field :id, -> { String }, optional: true, nullable: false

      field :object, -> { Square::Types::LoyaltyPromotionCreatedEventObject }, optional: true, nullable: false
    end
  end
end
