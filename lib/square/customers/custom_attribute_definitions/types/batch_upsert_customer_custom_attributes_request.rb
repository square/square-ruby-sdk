# frozen_string_literal: true

module Square
  module Customers
    module CustomAttributeDefinitions
      module Types
        class BatchUpsertCustomerCustomAttributesRequest < Internal::Types::Model
          field :values, -> { Internal::Types::Hash[String, Square::Types::BatchUpsertCustomerCustomAttributesRequestCustomerCustomAttributeUpsertRequest] }, optional: false, nullable: false
        end
      end
    end
  end
end
