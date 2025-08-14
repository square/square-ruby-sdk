
module Square
  module Merchants
    module CustomAttributes
      class UpsertMerchantCustomAttributeRequest
        field :merchant_id, String, optional: false, nullable: false
        field :key, String, optional: false, nullable: false
      end
    end
  end
end
