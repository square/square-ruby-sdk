# frozen_string_literal: true

module Square
  module Devices
    module Types
      class ListDevicesRequest < Internal::Types::Model
        field :cursor, -> { String }, optional: true, nullable: false
        field :sort_order, -> { Square::Types::SortOrder }, optional: true, nullable: false
        field :limit, -> { Integer }, optional: true, nullable: false
        field :location_id, -> { String }, optional: true, nullable: false
      end
    end
  end
end
