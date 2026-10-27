# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    class DeviceComponentDetailsEthernetDetails < Internal::Types::Model
      field :active, -> { Internal::Types::Boolean }, optional: true, nullable: true

      field :ip_address_v_4, -> { String }, optional: true, nullable: true, api_name: "ip_address_v4"

      field :mac_address, -> { String }, optional: true, nullable: true
    end
  end
end
