
module Square
  module Orders
    module CustomAttributes
      module Types
        class GetCustomAttributesRequest < Internal::Types::Model
          field :order_id, String, optional: false, nullable: false
          field :custom_attribute_key, String, optional: false, nullable: false
          field :version, Integer, optional: true, nullable: false
          field :with_definition, Internal::Types::Boolean, optional: true, nullable: false

        end
      end
    end
  end
end
