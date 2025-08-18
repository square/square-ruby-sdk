
module Square
  module Labor
    module Types
      class UpdateTimecardRequest < Internal::Types::Model
        field :id, String, optional: false, nullable: false
        field :timecard, Square::Types::Timecard, optional: false, nullable: false

      end
    end
  end
end
