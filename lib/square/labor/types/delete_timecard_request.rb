# frozen_string_literal: true

module Square
  module Labor
    module Types
      class DeleteTimecardRequest < Internal::Types::Model
        field :id, -> { String }, optional: false, nullable: false
      end
    end
  end
end
