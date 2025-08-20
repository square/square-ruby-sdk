# frozen_string_literal: true

module Square
  module Types
    # Represents a [ListJobs](api-endpoint:Team-ListJobs) response. Either `jobs` or `errors`
    # is present in the response. If additional results are available, the `cursor` field is also present.
    class ListJobsResponse < Internal::Types::Model
      field :jobs, -> { Internal::Types::Array[Square::Types::Job] }, optional: true, nullable: false
      field :cursor, -> { String }, optional: true, nullable: false
      field :errors, -> { Internal::Types::Array[Square::Types::Error] }, optional: true, nullable: false
    end
  end
end
