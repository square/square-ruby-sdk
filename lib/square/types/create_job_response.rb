# frozen_string_literal: true

module Square
    module Types
        # Represents a [CreateJob](api-endpoint:Team-CreateJob) response. Either `job` or `errors`
        # is present in the response.
        class CreateJobResponse < Square::Internal::Types::Model
            field :job, Square::Job, optional: true, nullable: false
            field :errors, Square::Internal::Types::Array[Square::Types::Error], optional: true, nullable: false
        end
    end
end
