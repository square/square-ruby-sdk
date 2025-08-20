# frozen_string_literal: true

module Square
  module Types
    # Contains metadata about a particular [Event](entity:Event).
    class EventMetadata < Internal::Types::Model
      field :event_id, -> { String }, optional: true, nullable: false
      field :api_version, -> { String }, optional: true, nullable: false
    end
  end
end
