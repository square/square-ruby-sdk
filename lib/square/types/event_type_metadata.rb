# frozen_string_literal: true

module Square
  module Types
    # Contains the metadata of a webhook event type.
    class EventTypeMetadata < Internal::Types::Model
      field :event_type, -> { String }, optional: true, nullable: false
      field :api_version_introduced, -> { String }, optional: true, nullable: false
      field :release_status, -> { String }, optional: true, nullable: false
    end
  end
end
