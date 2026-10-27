# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    # The data associated with a `loyalty.promotion.updated` event.
    class LoyaltyPromotionUpdatedEventData < Internal::Types::Model
      field :type, -> { String }, optional: true, nullable: true

      field :id, -> { String }, optional: true, nullable: false

      field :object, -> { Square::Types::LoyaltyPromotionUpdatedEventObject }, optional: true, nullable: false
    end
  end
end
