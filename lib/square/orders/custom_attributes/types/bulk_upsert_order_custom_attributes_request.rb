# frozen_string_literal: true

module Square
  module Orders
    module CustomAttributes
      module Types
        class BulkUpsertOrderCustomAttributesRequest < Internal::Types::Model
          field :values, lambda {
            Internal::Types::Hash[String, Square::Types::BulkUpsertOrderCustomAttributesRequestUpsertCustomAttribute]
          }, optional: false, nullable: false
        end
      end
    end
  end
end
