# frozen_string_literal: true

module Square
  module Devices
    module Types
      class ListDevicesRequest < Internal::Types::Model
        field :cursor, -> { String }, optional: true, nullable: true

        field :sort_order, -> { Square::Types::SortOrder }, optional: true, nullable: true

        field :limit, -> { Integer }, optional: true, nullable: true

        field :location_id, -> { String }, optional: true, nullable: true
      end
    end
  end
end
