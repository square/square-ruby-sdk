# frozen_string_literal: true

module Square
  module Types
    class JobCreatedEventObject < Internal::Types::Model
      field :job, Square::Job, optional: true, nullable: false

    end
  end
end
