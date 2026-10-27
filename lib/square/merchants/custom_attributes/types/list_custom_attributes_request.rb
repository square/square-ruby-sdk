# frozen_string_literal: true

module Square
  module Merchants
    module CustomAttributes
      module Types
        class ListCustomAttributesRequest < Internal::Types::Model
          field :merchant_id, -> { String }, optional: false, nullable: false

          field :visibility_filter, -> { Square::Types::VisibilityFilter }, optional: true, nullable: true

          field :limit, -> { Integer }, optional: true, nullable: true

          field :cursor, -> { String }, optional: true, nullable: true

          field :with_definitions, -> { Internal::Types::Boolean }, optional: true, nullable: true
        end
      end
    end
  end
end
