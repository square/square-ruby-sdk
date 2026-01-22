# frozen_string_literal: true

module Square
  module Merchants
    module CustomAttributes
      module Types
        class BulkUpsertMerchantCustomAttributesRequest < Internal::Types::Model
          field :values, -> { Internal::Types::Hash[String, Square::Types::BulkUpsertMerchantCustomAttributesRequestMerchantCustomAttributeUpsertRequest] }, optional: false, nullable: false
        end
      end
    end
  end
end
