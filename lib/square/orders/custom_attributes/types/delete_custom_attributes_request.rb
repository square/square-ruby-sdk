
module Square
  module Orders
    module CustomAttributes
      class DeleteCustomAttributesRequest
        field :order_id, String, optional: false, nullable: false
        field :custom_attribute_key, String, optional: false, nullable: false

      end
    end
  end
end
