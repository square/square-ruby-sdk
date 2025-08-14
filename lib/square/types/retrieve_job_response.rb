# frozen_string_literal: true

module Square
    module Types
        # Represents a [RetrieveJob](api-endpoint:Team-RetrieveJob) response. Either `job` or `errors`
        # is present in the response.
        class RetrieveJobResponse < Square::Internal::Types::Model
            field :job, Square::Job, optional: true, nullable: false
            field :errors, Square::Internal::Types::Array[Square::Error], optional: true, nullable: false
        end
    end
end
