# frozen_string_literal: true

module Square
  module Types
    class TerminalCheckoutQuerySort < Internal::Types::Model
      field :sort_order, -> { Square::Types::SortOrder }, optional: true, nullable: false

    end
  end
end
