# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    class DeviceComponentDetailsCardReaderDetails < Internal::Types::Model
      field :version, -> { String }, optional: true, nullable: false
    end
  end
end
