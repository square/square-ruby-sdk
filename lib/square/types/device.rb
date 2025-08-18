# frozen_string_literal: true

module Square
  module Types
    class Device < Internal::Types::Model
      field :id, -> { String }, optional: true, nullable: false
      field :attributes, -> { Square::Types::DeviceAttributes }, optional: false, nullable: false
      field :components, -> { Internal::Types::Array[Square::Types::Component] }, optional: true, nullable: false
      field :status, -> { Square::Types::DeviceStatus }, optional: true, nullable: false

    end
  end
end
