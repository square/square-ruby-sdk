# frozen_string_literal: true

module Square
  module Types
    class CardUpdatedEventData < Internal::Types::Model
      field :type, -> { String }, optional: true, nullable: false
      field :id, -> { String }, optional: true, nullable: false
      field :object, -> { Square::Types::CardUpdatedEventObject }, optional: true, nullable: false

    end
  end
end
