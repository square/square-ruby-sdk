# frozen_string_literal: true

module Square
  module Events
    module Types
      class ListEventTypesRequest < Internal::Types::Model
        field :api_version, -> { String }, optional: true, nullable: true
      end
    end
  end
end
