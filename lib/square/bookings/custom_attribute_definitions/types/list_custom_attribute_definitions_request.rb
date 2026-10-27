# frozen_string_literal: true

module Square
  module Bookings
    module CustomAttributeDefinitions
      module Types
        class ListCustomAttributeDefinitionsRequest < Internal::Types::Model
          field :limit, -> { Integer }, optional: true, nullable: true

          field :cursor, -> { String }, optional: true, nullable: true
        end
      end
    end
  end
end
