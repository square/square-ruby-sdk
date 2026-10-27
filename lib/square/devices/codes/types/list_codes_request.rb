# frozen_string_literal: true

module Square
  module Devices
    module Codes
      module Types
        class ListCodesRequest < Internal::Types::Model
          field :cursor, -> { String }, optional: true, nullable: true

          field :location_id, -> { String }, optional: true, nullable: true

          field :product_type, -> { String }, optional: true, nullable: true

          field :status, -> { Square::Types::DeviceCodeStatus }, optional: true, nullable: true
        end
      end
    end
  end
end
