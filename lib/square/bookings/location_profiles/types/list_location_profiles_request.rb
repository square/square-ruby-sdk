# frozen_string_literal: true

module Square
  module Bookings
    module LocationProfiles
      module Types
        class ListLocationProfilesRequest < Internal::Types::Model
          field :limit, -> { Integer }, optional: true, nullable: true

          field :cursor, -> { String }, optional: true, nullable: true
        end
      end
    end
  end
end
