# frozen_string_literal: true

module Square
  module Bookings
    module CustomAttributes
      module Types
        class ListCustomAttributesRequest < Internal::Types::Model
          field :booking_id, -> { String }, optional: false, nullable: false

          field :limit, -> { Integer }, optional: true, nullable: true

          field :cursor, -> { String }, optional: true, nullable: true

          field :with_definitions, -> { Internal::Types::Boolean }, optional: true, nullable: true
        end
      end
    end
  end
end
