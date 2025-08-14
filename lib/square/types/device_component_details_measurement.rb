# frozen_string_literal: true

module Square
    module Types
        # A value qualified by unit of measure.
        class DeviceComponentDetailsMeasurement < Square::Internal::Types::Model
            field :value, Integer, optional: true, nullable: false
        end
    end
end
