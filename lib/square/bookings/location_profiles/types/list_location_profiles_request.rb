
module Square
  module Bookings
    module LocationProfiles
      class ListLocationProfilesRequest < Internal::Types::Model
        field :limit, Integer, optional: true, nullable: false
        field :cursor, String, optional: true, nullable: false

      end
    end
  end
end
