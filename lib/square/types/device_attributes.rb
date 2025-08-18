# frozen_string_literal: true

module Square
  module Types
    class DeviceAttributes < Internal::Types::Model
      field :type, -> { String }, optional: false, nullable: false
      field :manufacturer, -> { String }, optional: false, nullable: false
      field :model, -> { String }, optional: true, nullable: false
      field :name, -> { String }, optional: true, nullable: false
      field :manufacturers_id, -> { String }, optional: true, nullable: false
      field :updated_at, -> { String }, optional: true, nullable: false
      field :version, -> { String }, optional: true, nullable: false
      field :merchant_token, -> { String }, optional: true, nullable: false

    end
  end
end
