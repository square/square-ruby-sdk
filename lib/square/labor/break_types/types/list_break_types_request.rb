# frozen_string_literal: true

module Square
  module Labor
    module BreakTypes
      module Types
        class ListBreakTypesRequest < Internal::Types::Model
          field :location_id, -> { String }, optional: true, nullable: true

          field :limit, -> { Integer }, optional: true, nullable: true

          field :cursor, -> { String }, optional: true, nullable: true
        end
      end
    end
  end
end
