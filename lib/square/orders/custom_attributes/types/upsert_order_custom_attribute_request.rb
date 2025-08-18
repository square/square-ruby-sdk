
module Square
  module Orders
    module CustomAttributes
      module Types
        class UpsertOrderCustomAttributeRequest < Internal::Types::Model
          field :order_id, String, optional: false, nullable: false
          field :custom_attribute_key, String, optional: false, nullable: false
          field :custom_attribute, Square::Types::CustomAttribute, optional: false, nullable: false
          field :idempotency_key, String, optional: true, nullable: false

        end
      end
    end
  end
end
