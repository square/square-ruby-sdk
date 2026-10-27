# frozen_string_literal: true

module Square
  module Labor
    module WorkweekConfigs
      module Types
        class ListWorkweekConfigsRequest < Internal::Types::Model
          field :limit, -> { Integer }, optional: true, nullable: true

          field :cursor, -> { String }, optional: true, nullable: true
        end
      end
    end
  end
end
