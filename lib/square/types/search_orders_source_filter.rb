# frozen_string_literal: true

module Square
    module Types
        # A filter based on order `source` information.
        class SearchOrdersSourceFilter < Square::Internal::Types::Model
            field :source_names, Square::Internal::Types::Array[String], optional: true, nullable: false
        end
    end
end
