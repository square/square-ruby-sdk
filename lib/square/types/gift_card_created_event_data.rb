# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    # The data associated with a `gift_card.created` event.
    class GiftCardCreatedEventData < Internal::Types::Model
      field :type, -> { String }, optional: true, nullable: true

      field :id, -> { String }, optional: true, nullable: false

      field :object, -> { Square::Types::GiftCardCreatedEventObject }, optional: true, nullable: false
    end
  end
end
