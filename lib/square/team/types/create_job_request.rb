
module Square
  module Team
    module Types
      class CreateJobRequest < Internal::Types::Model
        field :job, Square::Types::Job, optional: false, nullable: false
        field :idempotency_key, String, optional: false, nullable: false

      end
    end
  end
end
