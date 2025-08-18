# frozen_string_literal: true

module Square
  module Types
    # The wrapper object for the component entries of a given component type.
    class Component < Internal::Types::Model
      field :type, -> { Square::Types::ComponentComponentType }, optional: false, nullable: false
      field :application_details, -> { Square::Types::DeviceComponentDetailsApplicationDetails }, optional: true, nullable: false
      field :card_reader_details, -> { Square::Types::DeviceComponentDetailsCardReaderDetails }, optional: true, nullable: false
      field :battery_details, -> { Square::Types::DeviceComponentDetailsBatteryDetails }, optional: true, nullable: false
      field :wifi_details, -> { Square::Types::DeviceComponentDetailsWiFiDetails }, optional: true, nullable: false
      field :ethernet_details, -> { Square::Types::DeviceComponentDetailsEthernetDetails }, optional: true, nullable: false

    end
  end
end
