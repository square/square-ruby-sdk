# frozen_string_literal: true

module Square
  module Types
    class SearchTerminalCheckoutsResponse < Internal::Types::Model
      field :errors, Internal::Types::Array[Square::Types::Error], optional: true, nullable: false
      field :checkouts, Internal::Types::Array[Square::Types::TerminalCheckout], optional: true, nullable: false
      field :cursor, String, optional: true, nullable: false

    end
  end
end
