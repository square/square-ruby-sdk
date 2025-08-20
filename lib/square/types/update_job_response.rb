# frozen_string_literal: true

module Square
  module Types
    # Represents an [UpdateJob](api-endpoint:Team-UpdateJob) response. Either `job` or `errors`
    # is present in the response.
    class UpdateJobResponse < Internal::Types::Model
      field :job, -> { Square::Types::Job }, optional: true, nullable: false
      field :errors, -> { Internal::Types::Array[Square::Types::Error] }, optional: true, nullable: false
    end
  end
end
