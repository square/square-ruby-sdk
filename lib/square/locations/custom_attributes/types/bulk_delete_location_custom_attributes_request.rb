# frozen_string_literal: true

module Square
  module Locations
    module CustomAttributes
      module Types
        class BulkDeleteLocationCustomAttributesRequest < Internal::Types::Model
          field :values, -> { Internal::Types::Hash[String, Square::Types::BulkDeleteLocationCustomAttributesRequestLocationCustomAttributeDeleteRequest] }, optional: false, nullable: false
        end
      end
    end
  end
end
