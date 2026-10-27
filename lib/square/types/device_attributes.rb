# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    class DeviceAttributes < Internal::Types::Model
      field :type, -> { Square::Types::DeviceAttributesDeviceType }, optional: false, nullable: false

      field :manufacturer, -> { String }, optional: false, nullable: false

      field :model, -> { String }, optional: true, nullable: true

      field :name, -> { String }, optional: true, nullable: true

      field :manufacturers_id, -> { String }, optional: true, nullable: true

      field :updated_at, -> { String }, optional: true, nullable: false

      field :version, -> { String }, optional: true, nullable: false

      field :merchant_token, -> { String }, optional: true, nullable: true
    end
  end
end
