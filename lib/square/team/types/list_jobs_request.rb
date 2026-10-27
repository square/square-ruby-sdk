# frozen_string_literal: true

module Square
  module Team
    module Types
      class ListJobsRequest < Internal::Types::Model
        field :cursor, -> { String }, optional: true, nullable: true
      end
    end
  end
end
