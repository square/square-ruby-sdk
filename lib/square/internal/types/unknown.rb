# frozen_string_literal: true

module Square
  module Internal
    module Types
      module Unknown
        include square::Internal::Types::Type

        def coerce(value)
          value
        end
      end
    end
  end
end 