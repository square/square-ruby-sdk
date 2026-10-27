# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    # The data associated with the event.
    class CustomerDeletedEventData < Internal::Types::Model
      field :type, -> { String }, optional: true, nullable: true

      field :id, -> { String }, optional: true, nullable: false

      field :object, -> { Square::Types::CustomerDeletedEventObject }, optional: true, nullable: false
    end
  end
end
