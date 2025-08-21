# frozen_string_literal: true

module Square
  module Webhooks
    module EventTypes
      module Types
        class ListEventTypesRequest < Internal::Types::Model
          field :api_version, -> { String }, optional: true, nullable: false
        end
      end
    end
  end
end
