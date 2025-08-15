# frozen_string_literal: true

module Square
  # The wrapper object for the component entries of a given component type.
  class Component < Internal::Types::Model
    field :type, Square::ComponentComponentType, optional: false, nullable: false
    field :application_details, Square::DeviceComponentDetailsApplicationDetails, optional: true, nullable: false
    field :card_reader_details, Square::DeviceComponentDetailsCardReaderDetails, optional: true, nullable: false
    field :battery_details, Square::DeviceComponentDetailsBatteryDetails, optional: true, nullable: false
    field :wifi_details, Square::DeviceComponentDetailsWiFiDetails, optional: true, nullable: false
    field :ethernet_details, Square::DeviceComponentDetailsEthernetDetails, optional: true, nullable: false

  end
end
