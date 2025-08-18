
module Square
  module Team
    module Types
      class UpdateJobRequest < Internal::Types::Model
        field :job_id, String, optional: false, nullable: false
        field :job, Square::Types::Job, optional: false, nullable: false

      end
    end
  end
end
