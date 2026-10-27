# frozen_string_literal: true

module Square
  module Bookings
    module CustomAttributes
      module Types
        class GetCustomAttributesRequest < Internal::Types::Model
          field :booking_id, -> { String }, optional: false, nullable: false

          field :key, -> { String }, optional: false, nullable: false

          field :with_definition, -> { Internal::Types::Boolean }, optional: true, nullable: true

          field :version, -> { Integer }, optional: true, nullable: true
        end
      end
    end
  end
end
