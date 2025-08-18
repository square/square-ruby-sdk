
module Square
  module Merchants
    module CustomAttributes
      module Types
        class UpsertMerchantCustomAttributeRequest < Internal::Types::Model
          field :merchant_id, String, optional: false, nullable: false
          field :key, String, optional: false, nullable: false
          field :custom_attribute, Square::Types::CustomAttribute, optional: false, nullable: false
          field :idempotency_key, String, optional: true, nullable: false

        end
      end
    end
  end
end
