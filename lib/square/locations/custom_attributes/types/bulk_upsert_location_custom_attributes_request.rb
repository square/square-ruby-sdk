# frozen_string_literal: true

module Square
  module Locations
    module CustomAttributes
      module Types
        class BulkUpsertLocationCustomAttributesRequest < Internal::Types::Model
          field :values, -> { Internal::Types::Hash[String, Square::Types::BulkUpsertLocationCustomAttributesRequestLocationCustomAttributeUpsertRequest] }, optional: false, nullable: false
        end
      end
    end
  end
end
