# frozen_string_literal: true

module Square
  module Types
    # Published when a Job is updated.
    class JobUpdatedEvent < Internal::Types::Model
      field :merchant_id, String, optional: true, nullable: false
      field :type, String, optional: true, nullable: false
      field :event_id, String, optional: true, nullable: false
      field :created_at, String, optional: true, nullable: false
      field :data, Square::JobUpdatedEventData, optional: true, nullable: false

    end
  end
end
