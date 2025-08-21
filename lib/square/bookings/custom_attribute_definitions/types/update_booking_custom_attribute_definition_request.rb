# frozen_string_literal: true

module Square
  module Bookings
    module CustomAttributeDefinitions
      module Types
        class UpdateBookingCustomAttributeDefinitionRequest < Internal::Types::Model
          field :key, -> { String }, optional: false, nullable: false
          field :custom_attribute_definition, lambda {
            Square::Types::CustomAttributeDefinition
          }, optional: false, nullable: false
          field :idempotency_key, -> { String }, optional: true, nullable: false
        end
      end
    end
  end
end
