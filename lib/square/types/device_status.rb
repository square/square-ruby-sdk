# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    class DeviceStatus < Internal::Types::Model
      field :category, -> { Square::Types::DeviceStatusCategory }, optional: true, nullable: false
    end
  end
end
