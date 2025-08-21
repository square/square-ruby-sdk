# frozen_string_literal: true

module Square
  module Terminal
    module Checkouts
      module Types
        class SearchTerminalCheckoutsRequest < Internal::Types::Model
          field :query, -> { Square::Types::TerminalCheckoutQuery }, optional: true, nullable: false
          field :cursor, -> { String }, optional: true, nullable: false
          field :limit, -> { Integer }, optional: true, nullable: false
        end
      end
    end
  end
end
