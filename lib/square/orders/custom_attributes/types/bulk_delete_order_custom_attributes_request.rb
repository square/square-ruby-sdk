# frozen_string_literal: true

module Square
  module Orders
    module CustomAttributes
      module Types
        class BulkDeleteOrderCustomAttributesRequest < Internal::Types::Model
          field :values, -> { Internal::Types::Hash[String, Square::Types::BulkDeleteOrderCustomAttributesRequestDeleteCustomAttribute] }, optional: false, nullable: false
        end
      end
    end
  end
end
