# frozen_string_literal: true

module Square
  module Bookings
    module CustomAttributeDefinitions
      module Types
        class ListCustomAttributeDefinitionsRequest < Internal::Types::Model
          field :limit, -> { Integer }, optional: true, nullable: false
          field :cursor, -> { String }, optional: true, nullable: false
        end
      end
    end
  end
end
