# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    # Represents the data associated with a `gift_card.activity.created` event.
    class GiftCardActivityCreatedEventData < Internal::Types::Model
      field :type, -> { String }, optional: true, nullable: true

      field :id, -> { String }, optional: true, nullable: false

      field :object, -> { Square::Types::GiftCardActivityCreatedEventObject }, optional: true, nullable: false
    end
  end
end
