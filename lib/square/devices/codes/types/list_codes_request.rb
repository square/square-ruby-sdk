
module Square
  module Devices
    module Codes
      module Types
        class ListCodesRequest < Internal::Types::Model
          field :cursor, -> { String }, optional: true, nullable: false
          field :location_id, -> { String }, optional: true, nullable: false
          field :product_type, -> { String }, optional: true, nullable: false
          field :status, -> { Square::Types::DeviceCodeStatus }, optional: true, nullable: false

        end
      end
    end
  end
end
