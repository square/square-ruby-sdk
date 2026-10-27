# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    class DeviceComponentDetailsApplicationDetails < Internal::Types::Model
      field :application_type, -> { String }, optional: true, nullable: false

      field :version, -> { String }, optional: true, nullable: false

      field :session_location, -> { String }, optional: true, nullable: true

      field :device_code_id, -> { String }, optional: true, nullable: true
    end
  end
end
