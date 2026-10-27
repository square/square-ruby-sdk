# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    # Contains metadata about a particular [Event](entity:Event).
    class EventMetadata < Internal::Types::Model
      field :event_id, -> { String }, optional: true, nullable: true

      field :api_version, -> { String }, optional: true, nullable: true
    end
  end
end
