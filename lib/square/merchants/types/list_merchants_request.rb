# frozen_string_literal: true

module Square
  module Merchants
    module Types
      class ListMerchantsRequest < Internal::Types::Model
        field :cursor, -> { Integer }, optional: true, nullable: true
      end
    end
  end
end
