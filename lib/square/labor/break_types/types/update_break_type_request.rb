
module Square
  module Labor
    module BreakTypes
      module Types
        class UpdateBreakTypeRequest < Internal::Types::Model
          field :id, String, optional: false, nullable: false
          field :break_type, Square::Types::BreakType, optional: false, nullable: false

        end
      end
    end
  end
end
