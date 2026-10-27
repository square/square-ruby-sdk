# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    class DeviceCode < Internal::Types::Model
      field :id, -> { String }, optional: true, nullable: false

      field :name, -> { String }, optional: true, nullable: true

      field :code, -> { String }, optional: true, nullable: false

      field :device_id, -> { String }, optional: true, nullable: false

      field :product_type, -> { String }, optional: false, nullable: false

      field :location_id, -> { String }, optional: true, nullable: true

      field :status, -> { Square::Types::DeviceCodeStatus }, optional: true, nullable: false

      field :pair_by, -> { String }, optional: true, nullable: false

      field :created_at, -> { String }, optional: true, nullable: false

      field :status_changed_at, -> { String }, optional: true, nullable: false

      field :paired_at, -> { String }, optional: true, nullable: false
    end
  end
end
