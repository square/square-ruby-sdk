# frozen_string_literal: true

module Square
  # A filter based on order `source` information.
  class SearchOrdersSourceFilter < Internal::Types::Model
    field :source_names, Internal::Types::Array[String], optional: true, nullable: false

  end
end
