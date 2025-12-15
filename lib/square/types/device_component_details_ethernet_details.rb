# frozen_string_literal: true

module Square
  module Types
    class DeviceComponentDetailsEthernetDetails < Internal::Types::Model
      field :active, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :ip_address_v_4, -> { String }, optional: true, nullable: false, api_name: "ip_address_v4"
      field :mac_address, -> { String }, optional: true, nullable: false
    end
  end
end
