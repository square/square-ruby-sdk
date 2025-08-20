# frozen_string_literal: true

module Square
  module Merchants
    module CustomAttributes
      module Types
        class DeleteCustomAttributesRequest < Internal::Types::Model
          field :merchant_id, -> { String }, optional: false, nullable: false
          field :key, -> { String }, optional: false, nullable: false
        end
      end
    end
  end
end
