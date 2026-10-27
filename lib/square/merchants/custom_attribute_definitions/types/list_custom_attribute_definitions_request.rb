# frozen_string_literal: true

module Square
  module Merchants
    module CustomAttributeDefinitions
      module Types
        class ListCustomAttributeDefinitionsRequest < Internal::Types::Model
          field :visibility_filter, -> { Square::Types::VisibilityFilter }, optional: true, nullable: true

          field :limit, -> { Integer }, optional: true, nullable: true

          field :cursor, -> { String }, optional: true, nullable: true
        end
      end
    end
  end
end
