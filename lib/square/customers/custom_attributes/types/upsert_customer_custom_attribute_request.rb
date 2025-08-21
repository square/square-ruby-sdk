# frozen_string_literal: true

module Square
  module Customers
    module CustomAttributes
      module Types
        class UpsertCustomerCustomAttributeRequest < Internal::Types::Model
          field :customer_id, -> { String }, optional: false, nullable: false
          field :key, -> { String }, optional: false, nullable: false
          field :custom_attribute, -> { Square::Types::CustomAttribute }, optional: false, nullable: false
          field :idempotency_key, -> { String }, optional: true, nullable: false
        end
      end
    end
  end
end
