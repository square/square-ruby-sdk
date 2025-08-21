# frozen_string_literal: true

module Square
  module Types
    class DeviceComponentDetailsEthernetDetails < Internal::Types::Model
      field :active, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :ip_address_v_4, -> { String }, optional: true, nullable: false
    end
  end
end
