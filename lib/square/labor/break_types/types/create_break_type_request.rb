
module Square
  module Labor
    module BreakTypes
      module Types
        class CreateBreakTypeRequest < Internal::Types::Model
          field :idempotency_key, String, optional: true, nullable: false
          field :break_type, Square::Types::BreakType, optional: false, nullable: false

        end
      end
    end
  end
end
