# frozen_string_literal: true

module Square
  module Types
    # A filter to select customers based on exact or fuzzy matching of
    # customer attributes against a specified query. Depending on the customer attributes, 
    # the filter can be case-sensitive. This filter can be exact or fuzzy, but it cannot be both.
    class CustomerTextFilter < Internal::Types::Model
      field :exact, -> { String }, optional: true, nullable: false
      field :fuzzy, -> { String }, optional: true, nullable: false

    end
  end
end
