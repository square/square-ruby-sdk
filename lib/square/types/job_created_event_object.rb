# frozen_string_literal: true

module Square
  class JobCreatedEventObject < Internal::Types::Model
    field :job, Square::Job, optional: true, nullable: false

  end
end
