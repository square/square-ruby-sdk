
module Square
  module Merchants
    module CustomAttributes
      module Types
        class BulkDeleteMerchantCustomAttributesRequest < Internal::Types::Model
          field :values, Internal::Types::Hash[String, Square::Types::BulkDeleteMerchantCustomAttributesRequestMerchantCustomAttributeDeleteRequest], optional: false, nullable: false

        end
      end
    end
  end
end
