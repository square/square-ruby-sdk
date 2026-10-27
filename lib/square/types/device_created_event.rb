# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    # Published when a Device is created.
    class DeviceCreatedEvent < Internal::Types::Model
      field :merchant_id, -> { String }, optional: true, nullable: true

      field :type, -> { String }, optional: true, nullable: true

      field :event_id, -> { String }, optional: true, nullable: true

      field :created_at, -> { String }, optional: true, nullable: false

      field :data, -> { Square::Types::DeviceCreatedEventData }, optional: true, nullable: false
    end
  end
end
