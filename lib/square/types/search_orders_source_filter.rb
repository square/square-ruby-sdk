# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    # A filter based on order `source` information.
    class SearchOrdersSourceFilter < Internal::Types::Model
      field :source_names, -> { Internal::Types::Array[String] }, optional: true, nullable: true
    end
  end
end
