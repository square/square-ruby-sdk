# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    class EventData < Internal::Types::Model
      field :type, -> { String }, optional: true, nullable: true

      field :id, -> { String }, optional: true, nullable: false

      field :deleted, -> { Internal::Types::Boolean }, optional: true, nullable: true

      field :object, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: true
    end
  end
end
