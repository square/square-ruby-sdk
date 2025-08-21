# frozen_string_literal: true

module Square
  module Team
    module Types
      class RetrieveJobRequest < Internal::Types::Model
        field :job_id, -> { String }, optional: false, nullable: false
      end
    end
  end
end
